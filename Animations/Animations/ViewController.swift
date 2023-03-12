//
//  ViewController.swift
//  Animations
//
//  Created by damien on 16/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var image_index = 0
    var state = "stop"
    var timer = Timer()
    
    @IBOutlet weak var buttonText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonText.setTitle("Start", for: [])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var image: UIImageView!
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {self.image.alpha = 1})
        
    }

    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x:0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1) {
            self.image.frame = CGRect(x:0, y: 0, width: 200, height: 200)
        }
    }

    @IBAction func slildeIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration: 1) {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    @IBAction func nextButton(_ sender: Any) {
        
        if state == "stop" {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.displayImage), userInfo: nil, repeats: true)
            state = "start"
            buttonText.setTitle("Stop", for: [])
        }
        else {
            image_index = 0
            state = "stop"
            timer.invalidate()
            buttonText.setTitle("Start", for: [])
            let image_name = String(image_index) + ".gif"
            image.image = UIImage(named: image_name)
        }

    }
    
    @objc func displayImage() {
        let image_name = String(image_index) + ".gif"
        image.image = UIImage(named: image_name)
        
        image_index += 1
        
        if image_index > 71 {
            image_index = 0
        }
    }
}

