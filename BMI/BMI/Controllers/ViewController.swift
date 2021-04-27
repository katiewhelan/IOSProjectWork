//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    var calcBrain = CalcBrain()
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format:"%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calcBrain.calcBmi(weight, height)
        
    
       
      
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
//        let secondVc = SecondViewController()
//        secondVc.bmiValue = String(format: "%2f", bMI)
//        self.present(secondVc, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVc = segue.destination as! ResultsViewController
            destinationVc.bmiValue = calcBrain.getBMIValue()
            destinationVc.advice = calcBrain.getAdvice()
            destinationVc.color = calcBrain.getColor()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

