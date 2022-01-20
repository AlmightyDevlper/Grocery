//
//  EditViewController.swift
//  groceryApp
//
//  Created by mac on 26/12/2021.
//  Copyright © 2021 Thomas Shamoian. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Dish]?
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addDish(_ sender: Any) {
        //This is how we connect with our core data container
        let newDish = Dish(context: self.context)
        newDish.name = "Dolma"
        newDish.duration = 2.00
        
         let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        do {
            
            try self.context.save()
            self.present(vc, animated: true, completion: nil)
        } catch {
            print("Not saved")
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
