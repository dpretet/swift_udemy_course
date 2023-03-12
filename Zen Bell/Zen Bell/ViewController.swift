//
//  ViewController.swift
//  Zen Bell
//
//  Created by damien on 27/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var state = "stop"
    var time = 210
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var value: UITextField!

    @IBOutlet weak var unit: UISegmentedControl!

    @IBOutlet weak var startLabel: UIButton!

    @IBAction func start(_ sender: Any) {

        if state == "stop" {
            state = "start"
            startLabel.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        } else {
            state = "stop"
            startLabel.setTitle("Start", for: .normal)
            timer.invalidate()
        }
    }

    @objc func processTimer() {
        if time > 0 {
            time -= 1
            value.text = String(time)
        } else {
            state = "stop"
            startLabel.setTitle("Start", for: .normal)
            timer.invalidate()
            time = 0
        }
    }

}

