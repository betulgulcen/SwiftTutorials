//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Betül Gülcen on 5.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var namefield: UITextField!
    @IBOutlet weak var birthdayfield: UITextField!
    
    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var birthdaylabet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedname = UserDefaults.standard.object(forKey: "name")
        let storeddate = UserDefaults.standard.object(forKey: "birthday")
        
        // casting - as ? vs as !

        if let newname = storedname as? String {
            namelabel.text = "name: \(newname)"
        }
        
        if let newdate = storeddate as? String {
            birthdaylabet.text = "birthday: \(newdate)"
        }
        
    }

    @IBAction func saveclicked(_ sender: Any) {
                
        UserDefaults.standard.set(namefield.text, forKey: "name")
        UserDefaults.standard.set(birthdayfield.text, forKey: "birthday")
        //UserDefaults.standard.synchronize()
        
        namelabel.text = "name: \(namefield.text!)"
        
        birthdaylabet.text = "birthday: \(birthdayfield.text!)"
        
    }
    
    @IBAction func deleteclicked(_ sender: Any) {
        
        let storedname = UserDefaults.standard.object(forKey: "name")
        let storeddate = UserDefaults.standard.object(forKey: "birthday")
        
        if storedname is String{
            UserDefaults.standard.removeObject(forKey: "name")
            namelabel.text = "name: "
        }
        
        if storeddate is String{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdaylabet.text = "birthday: "
        }
        
    }
    
    
}

