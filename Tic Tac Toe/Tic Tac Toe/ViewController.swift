//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by damien on 19/08/2017.
//  Copyright © 2017 ThotLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initGrid()
        resetGrid()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func button00(_ sender: Any) {
        grid[0][0] = toggle(square: grid[0][0])
        drawGrid()
    }
    @IBAction func button01(_ sender: Any) {
        grid[0][1] = toggle(square: grid[0][1])
        drawGrid()
    }
    @IBAction func button02(_ sender: Any) {
        grid[0][2] = toggle(square: grid[0][2])
        drawGrid()
    }
    @IBAction func button10(_ sender: Any) {
        grid[1][0] = toggle(square: grid[1][0])
        drawGrid()
    }
    @IBAction func button11(_ sender: Any) {
        grid[1][1] = toggle(square: grid[1][1])
        drawGrid()
    }
    @IBAction func button12(_ sender: Any) {
        grid[1][2] = toggle(square: grid[1][2])
        drawGrid()
    }
    @IBAction func button20(_ sender: Any) {
        grid[2][0] = toggle(square: grid[2][0])
        drawGrid()
    }
    @IBAction func button21(_ sender: Any) {
        grid[2][1] = toggle(square: grid[2][1])
        drawGrid()
    }
    @IBAction func button22(_ sender: Any) {
        grid[2][2] = toggle(square: grid[2][2])
        drawGrid()
    }
    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    
    var grid = [[String]]()
    
    var state: String = "cross"

    @IBOutlet weak var score: UILabel!
    
    func initGrid() {
        grid.append(["blank", "blank", "blank"])
        grid.append(["blank", "blank", "blank"])
        grid.append(["blank", "blank", "blank"])

    }
    func resetGrid() {
        for i in 0...2 {
            for j in 0...2 {
                grid[i][j] = "blank"

            }
        }
        drawGrid()
    }

    @IBAction func restart(_ sender: Any) {
        score.text = ""
        resetGrid()
    }
    
    
    func drawGrid() {
        button00.setImage(UIImage(named: grid[0][0])?.withRenderingMode(.alwaysOriginal), for: .normal)
        button01.setImage(UIImage(named: grid[0][1])?.withRenderingMode(.alwaysOriginal), for: .normal)
        button02.setImage(UIImage(named: grid[0][2])?.withRenderingMode(.alwaysOriginal), for: .normal)
        button10.setImage(UIImage(named: grid[1][0])?.withRenderingMode(.alwaysOriginal), for: .normal)
        button11.setImage(UIImage(named: grid[1][1])?.withRenderingMode(.alwaysOriginal), for: .normal)
        button12.setImage(UIImage(named: grid[1][2])?.withRenderingMode(.alwaysOriginal), for: .normal)
        button20.setImage(UIImage(named: grid[2][0])?.withRenderingMode(.alwaysOriginal), for: .normal)
        button21.setImage(UIImage(named: grid[2][1])?.withRenderingMode(.alwaysOriginal), for: .normal)
        button22.setImage(UIImage(named: grid[2][2])?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        let score = checkGrid()

    }
    
    func toggle(square: String) -> String {
        if square == "blank" {
            if state == "cross" {
                state = "circle"
            } else {
                state = "cross"
            }
            return state
        } else {
            return square
        }
    }

    func checkGrid() -> Bool {
        
        if checkLine(line: [grid[0][0], grid[0][1], grid[0][2]]) == 1 { return true }
        if checkLine(line: [grid[1][0], grid[1][1], grid[1][2]]) == 1 { return true }
        if checkLine(line: [grid[2][0], grid[2][1], grid[2][2]]) == 1 { return true }
        if checkLine(line: [grid[0][0], grid[1][0], grid[2][0]]) == 1 { return true }
        if checkLine(line: [grid[0][1], grid[1][1], grid[2][1]]) == 1 { return true }
        if checkLine(line: [grid[0][2], grid[1][2], grid[2][2]]) == 1 { return true }
        if checkLine(line: [grid[0][0], grid[1][1], grid[2][2]]) == 1 { return true }
        if checkLine(line: [grid[2][2], grid[1][1], grid[0][2]]) == 1 { return true }
        return false
    }
    
    func checkLine(line: Array<String>) -> Int {
        
        if line[0] == line[1] && line[1] == line[2] {
            if line[0] != "blank" {
                score.text = line[0] + " wins!"
            }
            return 1
        }
        return 0
    }
    
}

