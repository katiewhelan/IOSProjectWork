//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Kathryn Whelan on 2/15/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var totalPerPerson : Double = 0.0
    var settings : String = ""
    
    @IBAction func recalcButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsLabel.text = settings
        totalLabel.text = String(format : "%.2f",totalPerPerson)
    }
}
