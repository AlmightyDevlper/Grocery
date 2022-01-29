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
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groceryTableView.dataSource = self
        groceryTableView.delegate = self
        
        self.fetchDish()
        //TODO: we need to assign it to a UITableViewController
        // Check documentation
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refreshTable), for: .valueChanged)
        self.groceryTableView.refreshControl = refreshControl
    }
    
    @objc func refreshTable() {
        //Update table
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.fetchDish()
            self.groceryTableView.refreshControl?.endRefreshing()
        }
        
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
        let dishImage = UIImage(data: dish.image!)
        
        cell.dishLbl.text = dish.name
        cell.dishDurationLbl.text = "Duration: \(dish.duration!)"
        cell.dishLevelLbl.text = "Hardness: \(dish.hardness!)"
        cell.dishImgView.image = dishImage
    
        cell.dishView.layer.cornerRadius = 5
        cell.dishView.layer.shadowOpacity = 0.8
        cell.dishView.layer.shadowRadius = 3
        cell.dishView.layer.shadowOffset = CGSize(width: 0 , height:3)
        cell.dishView.layer.shouldRasterize = true
        
        //Image of dish
        cell.dishImgView.layer.cornerRadius = 5
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let dish = self.items![indexPath.row]
        
        let storyboard: UIStoryboard = UIStoryboard(name: "dishDetailView", bundle: nil)
        
        let dishDetailViewC: UIViewController = storyboard.instantiateViewController(withIdentifier: "dishDetailView") as! ViewController
       
        self.present(dishDetailViewC, animated: true)
    }
}

