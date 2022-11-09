//
//  ViewController.swift
//  AlertProject
//
//  Created by Betül Gülcen on 9.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernamefield: UITextField!
    
    @IBOutlet weak var passwordfield: UITextField!
    
    @IBOutlet weak var pwagainfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func showalert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }


    @IBAction func signupclicked(_ sender: Any) {
        
        /*
         
         let alert = UIAlertController(title: "Hata", message: "Username not found", preferredStyle: UIAlertController.Style.alert)
         
         let okbutton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
         // button clicked
         print("button clicked")
         }
         
         alert.addAction(okbutton)
         
         self.present(alert, animated: true, completion: nil)
         
         */
        
        print("clicked")
        
        if usernamefield.text == "" {
            showalert(title: "error", message: "username not found")
        } else if passwordfield.text == "" {
            showalert(title: "error", message: "password not found")
        } else if passwordfield.text != pwagainfield.text {
            showalert(title: "error", message: "password do not match")
        } else {
            showalert(title: "success!", message: "user OK")
        }
    }
}

