//
//  ViewController.swift
//  Cat Years
//
//  Created by damien on 08/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var AgeField: UITextField!

    @IBAction func GetAgeAction(_ sender: Any) {
        
        if let age = AgeField.text {
            if let AgeInt = Int(age) {
                AgeDisplayed.text = "Your cat is " + String(AgeInt * 7) + " in cat years"
            }
        }
    }
    @IBOutlet weak var AgeDisplayed: UILabel!

}

