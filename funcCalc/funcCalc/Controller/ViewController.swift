//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypeing: Bool = true
    private var displayValue: Double {
        get {
            guard let num = Double(displayLabel.text!) else {fatalError("Cant convert")}
            return num
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    private var calcBrain = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypeing = true
        calcBrain.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            
            if let result = calcBrain.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypeing {
                displayLabel.text = numValue
                isFinishedTypeing = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

