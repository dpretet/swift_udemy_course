//
//  ViewController.swift
//  Sound Shaker
//
//  Created by damien on 05/09/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
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

            let rand = Int(arc4random_uniform(3) + 1)
            let filename = "0" + String(rand)
            let audioPath = Bundle.main.path(forResource: filename, ofType: "wav")
            
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            } catch {
                // Process any error
            }
            player.play()

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
