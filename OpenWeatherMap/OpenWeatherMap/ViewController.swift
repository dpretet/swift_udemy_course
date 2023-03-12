//
//  ViewController.swift
//  OpenWeatherMap
//
//  Created by damien on 02/10/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var town: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func submit(_ sender: Any) {
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + town.text!.replacingOccurrences(of: " ", with: "%20") + ",uk&appid=08e64df2d3f3bc0822de1f0fc22fcb2d") {
        
            let task = URLSession.shared.dataTask(with: url) {
                
                (data, response, error) in
                
                if error != nil {
                    
                } else {
                    
                    if let urlContent = data {
                        
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject // Added "as anyObject" to fix syntax error in Xcode 8 Beta 6
                            
                            print(jsonResult)
                            
                            print(jsonResult["name"])
                            
                            if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                
                                DispatchQueue.main.sync(execute: {
                                    
                                    self.result.text = description
                                    
                                })
                                
                            }
                            
                        } catch {
                            print("JSON processing failed")
                        }
                        
                    }
                }
            }
            
            task.resume()
        } else {
            print("can't create URL")
        }
        
    }
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

