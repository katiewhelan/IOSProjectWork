//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Kathryn Whelan on 2/15/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit



class ResultsViewController: UIViewController {
    
    var bmiValue : String?
    var advice : String?
    var color : UIColor?
    
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bMILabel: UILabel!

    @IBAction func recalcPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bMILabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
   

        // Do any additional setup after loading the view.
    }

   

}
