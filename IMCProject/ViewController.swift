//
//  ViewController.swift
//  IMCProject
//
//  Created by Tristan on 24/11/2018.
//  Copyright © 2018 Tristan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var baseWeight : String?
    var baseHeight : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer.text = "You are ..."
        value.text = "IMC:..."
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var weight : UITextField!
    @IBOutlet weak var height : UITextField!

    @IBOutlet weak var answer : UILabel!
    @IBOutlet weak var value : UILabel!
    
    @IBAction func calcIMC(sender: UIButton) {

        let weightNum = Double(weight.text!)
        var heightNum = Double(height.text!)
        var result : Double
        
        
        
        if (weight.text != "" && height.text != "") {
            let isNum1 = CharacterSet.decimalDigits.isSuperset(of : CharacterSet(charactersIn: weight.text!))
            let isNum2 = CharacterSet.decimalDigits.isSuperset(of : CharacterSet(charactersIn: height.text!))
            if (isNum1 && isNum2) {
                if (heightNum! > Double(100)) {
                    heightNum! /= 100
                }
            
                result = round(weightNum! / pow(heightNum!, 2) * 10) / 10
                value.text = "IMC: \(String(result))"
                switch result {
                case result where result <= 18.4:
                    answer.text = "You are Under weight"
                    answer.textColor = UIColor.red
                case result where result <= 25:
                    answer.text = "You are Normal weight"
                    answer.textColor = UIColor.green
                case result where result <= 30:
                    answer.text = "You are Over weight"
                    answer.textColor = UIColor.red
                case result where result > 30:
                    answer.textColor = UIColor.red
                    answer.text = "You are Obese weight"
                default:
                    print("default")
                }
                print("weightNum = \(weightNum!) && heightNum = \(heightNum!) && result = \(result)")
                print("num1 = \(isNum1) && num2 = \(isNum2)")
            } else {
                value.text = "IMC:..."
                answer.textColor = UIColor.red
                answer.text = "You can only use numerical number"
            }

        } else {
            value.text = "IMC:..."
            answer.textColor = UIColor.red
            answer.text = "You need to fill every field"
        }
        
    }
    
}
