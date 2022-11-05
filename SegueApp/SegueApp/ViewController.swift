//
//  ViewController.swift
//  SegueApp
//
//  Created by Betül Gülcen on 6.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var username = ""
    
    @IBOutlet weak var defaultlabel: UILabel!
    
    @IBOutlet weak var namefield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextbutton(_ sender: Any) {
        username = namefield.text!
        performSegue(withIdentifier: "tosecondview", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "tosecondview" {
            //as -- casting
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myname = username
        }
    }
    
}

