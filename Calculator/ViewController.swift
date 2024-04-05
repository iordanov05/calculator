//
//  ViewController.swift
//  Calculator
//
//  Created by programmer on 29.06.2018.
//  Copyright © 2018 programmer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lastnumber: String = ""
    var x:Double = 0
    var y:Double = 0
    var EnterFlag = 0
    var OperationActive = 0
    var yFlag = 1
    var decimalPoint = 0
    var power = 1
     @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func Numbers(_ sender: UIButton)
    {
        print("Цифра  \(sender.tag)")
        
        if EnterFlag == 1
        {
            x = 0
             EnterFlag = 0
        }
        if decimalPoint == 0 {
           x = x * 10 + Double(sender.tag)
            switch String(x)
            {
            case let z where z.hasSuffix(".0"):
             self.label.text = "" + String(x)
            default:self.label.text="" + String(x)
            }
            
            }
        else {
            x = x + Double(sender.tag)/pow(10,Double (power))
            power = power + 1
            self.label.text = String(x)
        }
        }
    
    
    
    @IBAction func znaki(_ sender: UIButton)
    {
      print("Operation \(sender.tag)")
        if EnterFlag != 1 && yFlag == 1
        {
            switch OperationActive{
            case 100:
                x = y - x
            case 101:
                x = y + x
            case 102:
                x = y * x
            case 103:
               x = y / x
            default:
                self.label.text = "" + String(x)
            }
        }
        OperationActive = sender.tag
        y = x
        yFlag = 1
        EnterFlag = 1
        self.label.text = "" + String(x)
        power = 1
        decimalPoint = 0
    }
    

 
    @IBAction func zap(_ sender: UIButton) {
        print("Tochka")
        if decimalPoint == 0
        {
           decimalPoint = 1
            self.label.text = self.label.text! + "."
        }
    }
    @IBAction func AC(_ sender: UIButton)
    {
    print("Clear")
        x = 0
        y = 0
        self.label.text = "" + String(x)
        EnterFlag = 1
        yFlag = 1
        power = 1
        OperationActive = 0
    }
}

