//
//  EditViewController.swift
//  groceryApp
//
//  Created by mac on 26/12/2021.
//  Copyright © 2021 Thomas Shamoian. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var dishTitle: UITextField!
    @IBOutlet weak var dishDuration: UITextField!
    @IBOutlet weak var dishDescription: UITextView!
    @IBOutlet weak var dishHardness: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Dish]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editView.layer.cornerRadius = 5
        

    }
    
    
    @IBAction func addDish(_ sender: Any) {
        //This is how we connect with our core data container
        let newDish = Dish(context: self.context)
//        var disTime =
        newDish.name = dishTitle.text
        newDish.ingredients = dishDescription.text
//        if (dishDuration.text == nil) {
//            disTime = 0
//        } else {
//            disTime =
//        }
        newDish.duration = Double(dishDuration.text!)!
        
         let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        do {
            
            try self.context.save()
            self.present(vc, animated: true, completion: nil)
        } catch {
            print("Not saved")
        }
        
    }

}

