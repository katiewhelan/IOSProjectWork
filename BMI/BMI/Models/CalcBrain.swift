//
//  CalcBrain.swift
//  BMI Calculator
//
//  Created by Kathryn Whelan on 2/15/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalcBrain {
    var bmi : Bmi?
    
  func  getBMIValue() -> String {
 
    let bmiToDec = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDec
    }
    
    func getColor()-> UIColor {
        return bmi?.color ?? UIColor.clear
    }
    
    func getAdvice()-> String {
        return bmi?.advice ?? "Something went wrong Recalulate"
    }
    
    
    mutating func calcBmi(_ w: Float, _ h: Float) {
        let bmiValue = w/(h * h)
        var adviceString : String
        
        
        if bmiValue <= 18.5 {
            adviceString = "underweight: Eat More Snacks"
            bmi = Bmi(value: bmiValue, advice : adviceString, color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        } else if bmiValue < 24.9 {
            adviceString = "normal: Keep it up"
            bmi = Bmi(value: bmiValue, advice : adviceString, color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        }else {
            adviceString = "overWeight: Seek medical advice"
            bmi = Bmi(value: bmiValue, advice : adviceString, color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        }
        print(adviceString)
    }
}
    

