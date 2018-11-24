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
        value.isHidden = true
        //view?.backgroundColor = UIColor(red: 152, green: 252, blue: 196, alpha: 1)
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
            var isNum1 = CharacterSet.decimalDigits.isSuperset(of : CharacterSet(charactersIn: weight.text!))
            var isNum2 = CharacterSet.decimalDigits.isSuperset(of : CharacterSet(charactersIn: height.text!))
            if (isNum1 && isNum2) {
                if (heightNum! > Double(100)) {
                    heightNum! /= 100
                }
            
                result = round(weightNum! / pow(heightNum!, 2) * 10) / 10
                value.isHidden = false
                value.text = String(result)
                switch result {
                case result where result <= 18.4:
                    answer.text = "Under weight"
                    answer.textColor = UIColor.red
                    print("result is inferior at 18.4")
                case result where result <= 25:
                    answer.text = "Normal weight"
                    answer.textColor = UIColor.green
                    print("result is superior at 18.4 but inferior at 25")
                case result where result <= 30:
                    answer.text = "Over weight"
                    answer.textColor = UIColor.red
                    print("result is superior at 25 but inferior at 30")
                case result where result > 30:
                    answer.textColor = UIColor.red
                    answer.text = "Obese weight"
                    print("result is superior at 30")
                default:
                    print("default")
                }
                print("weightNum = \(weightNum!) && heightNum = \(heightNum!) && result = \(result)")
                print("num1 = \(isNum1) && num2 = \(isNum2)")
            } else {
                value.isHidden = true
                answer.textColor = UIColor.red
                answer.text = "You can only use numerical number"
            }

        } else {
            value.isHidden = true
            answer.textColor = UIColor.red
            answer.text = "You need to fill every field"
        }
        
    }
    
}
