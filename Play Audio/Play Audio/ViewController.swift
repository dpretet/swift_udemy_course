//
//  ViewController.swift
//  Play Audio
//
//  Created by damien on 26/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBAction func playButton(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        player.pause()
    }
    
    @IBOutlet weak var volumeValue: UISlider!
    
    var player = AVAudioPlayer()
    
    @IBAction func sliderChange(_ sender: Any) {
        player.volume = volumeValue.value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = Bundle.main.path(forResource: "debussy-sb-clairdelune-yamadascriba", ofType: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            // Process any error
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

