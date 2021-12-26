//
//  ViewController.swift
//  groceryApp
//
//  Created by mac on 24/12/2021.
//  Copyright © 2021 Thomas Shamoian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dishes = ["thai Curry", "Spageti", "pizza"]

    @IBOutlet var groceryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groceryTableView.dataSource = self
        groceryTableView.delegate = self
    }

}

//Huidige controller uitbreiden met de UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groceryTableView.dequeueReusableCell(withIdentifier: "dishesList") as! dishesListCellTableViewCell
        cell.dishLbl.text = dishes[indexPath.row]
        
        
        cell.dishView.layer.cornerRadius = 5
        cell.dishView.layer.shadowOpacity = 0.8
        cell.dishView.layer.shadowRadius = 3
        cell.dishView.layer.shadowOffset = CGSize(width: 0 , height:3)
        cell.dishView.layer.shouldRasterize = true
        
        return cell

    }
}

