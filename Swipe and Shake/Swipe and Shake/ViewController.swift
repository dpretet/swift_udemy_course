//
//  ViewController.swift
//  Swipe and Shake
//
//  Created by damien on 05/09/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeRigth = UISwipeGestureRecognizer(target: self, action: #selector((ViewController.swiped(gesture:))))
        swipeRigth.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRigth)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector((ViewController.swiped(gesture:))))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            print("Device was shaken")
        }
    }
    
    @objc func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
                case UISwipeGestureRecognizerDirection.right:
                    print("User swiped right")
                
                case UISwipeGestureRecognizerDirection.left:
                    print("User swiped left")

                default:
                    print("No recognized switch")
            }
        }
        
    }
    
}

