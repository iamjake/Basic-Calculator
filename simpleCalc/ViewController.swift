//
//  ViewController.swift
//  simpleCalc
//   *Extremely Crude Implementation of Calculator
//   *Many features are currently broken and will be fixing soon
//
//  Created by Jacob Jurilla on 1/24/18.
//  Copyright © 2018 Jacob Jurilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var numOnScreen:Double = 0
    var prevNum:Double = 0
    var currNum:Double = 0
    var doOp = false
    var ops:Int = 0
    
    @IBOutlet weak var cDisplay: UILabel!
    
    @IBAction func pressing_num(_ sender: UIButton)
    {
        if doOp == true{
            cDisplay.text = String(sender.tag-1)
            currNum = Double(cDisplay.text!)!
            doOp = false
        }
        else {
            cDisplay.text = cDisplay.text! + String(sender.tag-1)
            numOnScreen = Double(cDisplay.text!)!
        }
    }
    
    @IBAction func calculation_button(_ sender: UIButton)
    {
        if cDisplay.text != "" && sender.tag != 11 && sender.tag != 14
        {
            prevNum = Double(cDisplay.text!)!
            ops = sender.tag
            doOp = true;
        }
        else if sender.tag == 14
        {
            if ops == 16 {
                cDisplay.text = String(prevNum / currNum)
            }
            else if ops == 17 {
                cDisplay.text = String(prevNum * currNum)
            }
            else if ops == 18 {
                cDisplay.text = String(prevNum - currNum)
            }
            else if ops == 19 {
                cDisplay.text = String(prevNum + currNum)
            }
            
        }
        else if sender.tag == 11
        {
            cDisplay.text = ""
            prevNum = 0;
            currNum = 0;
            ops = 0;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

