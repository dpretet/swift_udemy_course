//
//  ViewController.swift
//  AppTimes Tables
//
//  Created by damien on 11/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = String(Int(SliderValue.value*50) * (indexPath.row + 1))
        return cell
        
    }
    @IBOutlet weak var Table: UITableView!
    @IBAction func SliderAction(_ sender: Any) {
        Table.reloadData()
    }
    @IBOutlet weak var SliderValue: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

