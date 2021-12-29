//
//  ViewController.swift
//  groceryApp
//
//  Created by mac on 24/12/2021.
//  Copyright © 2021 Thomas Shamoian. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var dishes = ["thai Curry", "Spageti", "pizza"]
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //lets make some dummy data
    
    
    var items:[Dish]?
    
    @IBOutlet var groceryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groceryTableView.dataSource = self
        groceryTableView.delegate = self
        
        
        createDummyData()
    }
    
    func fetchDish() {
        do {
            self.items = try context.fetch(Dish.fetchRequest())
            
            if Thread.isMainThread {
                groceryTableView.reloadData()
            } else {
                DispatchQueue.main.sync {
                    groceryTableView.reloadData()
                }
            }
        } catch {
            // throw mess
        }
    }
    
    func createDummyData() {
        //This is how we connect with our core data container
        let newDish = Dish(context: self.context)
        newDish.name = "Dolma"
        newDish.duration = 2.00
        
        do {
            
            try self.context.save()
            
        } catch {
            
        }
        
        self.fetchDish()
    }

}

//Huidige controller uitbreiden met de UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items!.count
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") {
            (action, view, completionHandler) in
            
            let dishToRemove = self.items![indexPath.row]
            
            self.context.delete(dishToRemove)
            
            do {
                try self.context.save()
            } catch {
                
            }
            
            self.fetchDish()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groceryTableView.dequeueReusableCell(withIdentifier: "dishesList") as! dishesListCellTableViewCell
        
        let dish = self.items![indexPath.row]
        
        cell.dishLbl.text = dish.name
        
        cell.dishView.layer.cornerRadius = 5
        cell.dishView.layer.shadowOpacity = 0.8
        cell.dishView.layer.shadowRadius = 3
        cell.dishView.layer.shadowOffset = CGSize(width: 0 , height:3)
        cell.dishView.layer.shouldRasterize = true
        
        return cell

    }
}

