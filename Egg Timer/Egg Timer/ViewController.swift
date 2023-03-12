//
//  ViewController.swift
//  Egg Timer
//
//  Created by damien on 11/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var time = 210

    @IBAction func PlayButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func PauseButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func DecrementButton(_ sender: Any) {
        
        if time > 10 {
            time -= 10
            TimerValue.text = String(time)
        }
    }
    
    @IBAction func ResetButton(_ sender: Any) {
        time = 210
        TimerValue.text = String(time)
    }
    
    @IBAction func IncrementButton(_ sender: Any) {
        if time > 10 {
            time += 10
            TimerValue.text = String(time)
        }
    }
    
    @objc func processTimer() {
        if time > 0 {
            time -= 1
            TimerValue.text = String(time)
        } else {
            timer.invalidate()
            time = 0
        }
    }
    
    @IBOutlet weak var TimerValue: UILabel!
    
    @IBOutlet weak var IncrementButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TimerValue.text = "210"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

