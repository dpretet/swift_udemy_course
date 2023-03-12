//
//  ViewController.swift
//  Is it Prime
//
//  Created by damien on 09/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberText: UITextField!
    
    @IBOutlet weak var isPrimeLabel: UILabel!
    
    @IBAction func isPrimeButton(_ sender: Any) {
        
        if let numberField = numberText.text {
            
            let numberInt = Int(numberField)
            
            if let number = numberInt {
            
                if numberInt == 1 {
                    isPrimeLabel.text = "Is prime!"
                }
                else {
                    
                    var i = 2
                    isPrimeLabel.text  = "Is prime!"
                    while i < number {
                        if number % i == 0 {
                            isPrimeLabel.text  = "Is not prime!"
                            i = number
                        }
                        i += 1
                    }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

