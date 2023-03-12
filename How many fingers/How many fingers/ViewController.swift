//
//  ViewController.swift
//  How many fingers
//
//  Created by damien on 08/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var guessText: UITextField!
    @IBOutlet weak var guessCheck: UIButton!
    @IBOutlet weak var checkDisplay: UILabel!

    @IBAction func guessButton(_ sender: Any) {
        
        let diceRoll = arc4random_uniform(6)
        
        if let numberText = guessText.text {
            
            let number = UInt32(numberText)
            if diceRoll != number {
                checkDisplay.text = "You fail!"
            }
            else {
                checkDisplay.text = "You win!"
            }
        }
        else {
            print("ERROR")
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

