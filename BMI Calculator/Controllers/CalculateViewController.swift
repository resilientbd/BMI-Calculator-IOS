//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var text_height: UILabel!
    
    @IBOutlet weak var text_weight: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    var calculatorBrain = CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSlider.value = 1
        weightSlider.value = 50
        text_height.text = "1.00 M"
        text_weight.text = "50.00 KG"
    }

    @IBAction func heightValueChanged(_ sender: UISlider) {
        text_height.text = "\(String(format: "%.2f", sender.value)) M"
       
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        text_weight.text = "\(String(format: "%.2f", sender.value)) KG"
        print("Weight:\(sender.value)")
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight/(height*height)
        calculatorBrain.calculateBMI(height:height,weight:weight)
        print("bmi:\(bmi)")
        
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1f", bmi)
//        self.present(secondVC, animated: true, completion: nil)
        
//        let resultVC = ResultViewController()
//        resultVC.bmiLabel.text = String(format: "%.1f", bmi)
//        self.present(resultVC, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "goToResult", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult")
        {

            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMI()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

