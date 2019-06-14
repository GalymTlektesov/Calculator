//
//  ViewController.swift
//  Calculator
//
//  Created by admin on 5/8/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberForscreen: Double = 0
    var firstNum: Double = 0
    var operation: Int = 0
    var mathSign: Bool = false
    var fraction: Bool = false
    
    
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func Digits(_ sender: UIButton) {
        if sender.tag == 17{
            numberForscreen = numberForscreen * -1
            result.text = String(numberForscreen)
        }
        else if sender.tag == 18{
            result.text = result.text! + "."
        }
        else if sender.tag == 16{
            result.text = String(result.text!.dropLast())
        }
        else if mathSign == true || result.text == "0"{
            result.text = String(sender.tag)
            mathSign = false
        }
        else if sender.tag != 18{
            result.text = result.text! + String(sender.tag)
        }
        numberForscreen = Double(result.text!)!
    }
    
    @IBAction func Buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            if sender.tag == 11{//деление
                result.text = "/"
            }
            if sender.tag == 12{//произведение
                result.text = "x"
            }
            if sender.tag == 13{//вычетание
                result.text = "-"
            }
            if sender.tag == 14{//сложение
                result.text = "+"
            }
            operation = sender.tag
            mathSign = true
        }
        else if sender.tag == 15{// почитать всё
            if operation == 11{
                result.text = String(firstNum / numberForscreen)
            }
            if operation == 12{
                result.text = String(firstNum * numberForscreen)
            }
            if operation == 13{
                result.text = String(firstNum - numberForscreen)
            }
            if operation == 14{
                result.text = String(firstNum + numberForscreen)
            }
        }
        else if sender.tag == 10{
            result.text = "0"
            firstNum = 0
            numberForscreen = 0
            operation = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

