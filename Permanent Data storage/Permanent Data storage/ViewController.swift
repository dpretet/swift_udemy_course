//
//  ViewController.swift
//  Permanent Data storage
//
//  Created by damien on 11/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PhoneNumber: UITextField!
    @IBAction func StoreNumber(_ sender: Any) {
    
        UserDefaults.standard.set(PhoneNumber.text, forKey: "number")
    
    }
    @IBAction func PrintNumber(_ sender: Any) {
        
        let numberObject = UserDefaults.standard.object(forKey: "number")
        
        if let number = numberObject as? String {
            NumberStored.text = String(number)
        }
    }
    @IBOutlet weak var NumberStored: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Here initialize first the database
        // UserDefaults.standard.set("Damien", forKey: "name")
        
        let nameObject = UserDefaults.standard.object(forKey: "name")
        
        if let name = nameObject as? String {
            print(name)
        }
        // Here initialize first the database
        //let arr = [1, 2, 3]
        //UserDefaults.standard.set(arr, forKey: "array")
        
        let arrObject = UserDefaults.standard.object(forKey: "array")
        
        if let array = arrObject as?  NSArray {
            print(array)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

