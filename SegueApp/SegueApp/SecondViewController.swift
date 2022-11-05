//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Betül Gülcen on 6.11.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var namelabel: UILabel!
    
    var myname = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namelabel.text = myname

    }

}
