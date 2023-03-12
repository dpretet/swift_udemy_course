//
//  SecondViewController.swift
//  Advanced Segues
//
//  Created by damien on 26/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var username = "damien"
    var activeRow = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondViewController" {

            let secondViewController = segue.destination as! SecondViewController
            secondViewController.activeRow = activeRow
            //secondViewController.username = "Dude"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
