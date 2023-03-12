//
//  ViewController.swift
//  Back to Bach
//
//  Created by damien on 27/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "bach", ofType: "mp3")
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            time.maximumValue = Float(player.duration)
        
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func volumeChanged(_ sender: Any) {
        player.volume = volume.value
    }
    
    @IBOutlet weak var volume: UISlider!
    
    @IBAction func timeChanged(_ sender: Any) {
        player.currentTime = TimeInterval(time.value)
    }
    
    @IBOutlet weak var time: UISlider!
    
    @IBAction func stop(_ sender: Any) {
        player.pause()
        timer.invalidate()
        player.currentTime = 0
        time.value = 0
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @objc func updateTime() {
        time.value = Float(player.currentTime)
    }
}

