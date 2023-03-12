//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by damien on 13/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Display from HTML in a string
        // WebView.loadHTMLString("<h1>Hello World!</h1>", baseURL: nil)
        
        // Display a website
        /*
         if let url = URL(string: "https://stackoverflow.com") {

         WebView.loadRequest(URLRequest(url: url))
         }
        */
        
        // Extract data of this site
        if let url = URL(string: "https://stackoverflow.com") {

            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error as Any)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString as Any)
                    }
                }
            }
            task.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

