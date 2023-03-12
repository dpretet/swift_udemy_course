//
//  SecondViewController.swift
//  uDo
//
//  Created by damien on 12/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var task: UITextField!
    
    @IBAction func addTask(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        var items:[String]
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(task.text!)
        } else {
            items = [task.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        task.text = ""
    }
    
    // Hide the keyboard if user touchs outisde the keyboard area
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Hide the keyboard if user touchs return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

