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
    var unitState : Int = 0

    @IBOutlet weak var unit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer.text = "You are ..."
        value.text = "IMC:..."
        unit.setTitle("cm | Kg", for: .normal)
        weight.placeholder = "Weight (kilogrammes)"
        height.placeholder = "height (centimeters)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var weight : UITextField!
    @IBOutlet weak var height : UITextField!

    @IBOutlet weak var answer : UILabel!
    @IBOutlet weak var value : UILabel!
    
    @IBAction func swapUnit(sender: UIButton) {
        if (unitState == 0) {
            print("unit test = 1")
            unitState = 1
            unit.setTitle("inches | pounds", for: .normal)
            weight.placeholder = "Weight (pounds)"
            height.placeholder = "Height (inches)"
        } else {
            print("unit test = 0")
            unitState = 0
            unit.setTitle("cm | Kg", for: .normal)
            weight.placeholder = "Weight (kilogrammes)"
            height.placeholder = "Height (centimeters)"
        }
    }
    
    @IBAction func calcIMC(sender: UIButton) {
        var weightNum = Double(weight.text!)
        var result : Double
        var heightNum = Double(height.text!)
            
            if (weightNum != nil &&  heightNum != nil) {
                
                if (weightNum! <= 0 || heightNum! <= 0) {
                    value.text = "IMC:..."
                    answer.textColor = UIColor.red
                    answer.text = "Invalid number"
                } else {
                    if (unitState == 1) {
                        weightNum = weightNum! * 2.2
                        heightNum = heightNum! / 2.54
                    }
                    
                    
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
                        answer.text = "You are normal"
                        answer.textColor = UIColor.green
                    case result where result <= 30:
                        answer.text = "You are over weight"
                        answer.textColor = UIColor.red
                    case result where result > 30:
                        answer.textColor = UIColor.red
                        answer.text = "You are obese"
                    default:
                        print("default")
                    }
                }
                
            } else {
                value.text = "IMC:..."
                answer.textColor = UIColor.red
                answer.text = "You can only use numerical number"
            }

        }
    }
