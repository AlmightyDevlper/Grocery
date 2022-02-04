//
//  EditViewController.swift
//  groceryApp
//
//  Created by mac on 26/12/2021.
//  Copyright © 2021 Thomas Shamoian. All rights reserved.
//

import UIKit

class EditViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var dishTitle: UITextField!
    @IBOutlet weak var dishDuration: UITextField!
    @IBOutlet weak var dishDescription: UITextView!
    @IBOutlet weak var dishHardness: UITextField!
    @IBOutlet weak var fetchImage: UIImageView!
    
    var tempImgData: Data!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Dish]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        editView.layer.cornerRadius = 5
        fetchImage.layer.cornerRadius = 5

    }
    
    
    @IBAction func uploadImg(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
        fetchImage.image = userPickedImage

        picker.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func addDish(_ sender: Any) {
        //This is how we connect with our core data container
        let newDish = Dish(context: self.context)
        
        let ac = UIAlertController(title: "Added", message: "dish has been added!", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    
        newDish.image = (fetchImage?.image)!.pngData()
        newDish.name = dishTitle.text
        newDish.ingredients = dishDescription.text
        newDish.duration = dishDuration.text
        newDish.hardness = dishHardness.text
        
        do {
            try self.context.save()
            self.present(ac, animated: true)
        } catch {
            print("Not saved")
        }
        
    }

}

