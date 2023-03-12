//
//  ViewController.swift
//  My Second App
//
//  Created by damien on 08/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Clicked(_ sender: Any) {
        
        print("Button clicked!")
        
        if let age = AgeText.text {
        
            DisplayLabel.text = "You are " + age
        }
        
    }

    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var AgeText: UITextField!

    @IBOutlet weak var DisplayLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

