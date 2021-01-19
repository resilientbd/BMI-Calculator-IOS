//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Sk Faisal on 19/1/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit
struct CalculatorBrain {
    var bmi:BMI?
    
    mutating func calculateBMI(height:Float,weight:Float) {
        let bmi = weight/(height*height)
        var advice:String?
        var color:UIColor?
        
        if(bmi>0&&bmi<18.5)
        {
            advice = "Underweight"
            color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
        else if(bmi>18.5 && bmi<24.9)
        {
            advice = "Normal Weight"
            color = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        }
        else if(bmi>25)
        {
            advice = "OverWeight"
            color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        
        self.bmi = BMI(value: bmi, advice: advice, color: color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }
    func getBMI() -> String {
        let value:Float = bmi?.value ?? 0.0
        return String(format: "%.1f", value)
    }
    func getAdvice() -> String {
        let value:String = bmi?.advice ?? ""
        return value
    }
    func getColor() -> UIColor {
        let color:UIColor = bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return color
    }
    
}
