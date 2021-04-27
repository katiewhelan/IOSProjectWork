//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    var numberOfSplits : Double = 2.0
    var totalBillPerPerson : Double = 0.0
    var percentTip : Double = 0.1

    @IBAction func splitStepper(_ sender: UIStepper) {
        print(sender.value)
        numberOfSplits = sender.value
        splitNumberLabel.text = String(format: "%.0f", numberOfSplits)
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        let optionalPercent = sender.currentTitle ?? "default"
        if sender.currentTitle == "20%"{
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            percentTip = 0.2
        } else if sender.currentTitle == "10%"{
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            percentTip = 0.1
        } else if sender.currentTitle == "0%"{
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = true
            percentTip = 0.0
        } else {
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        print(billTextField.text!)
        let totalBill = Double(billTextField.text!) ?? 0.0
        totalBillPerPerson = (totalBill * (percentTip+1.0))/numberOfSplits
        self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            
            if let resultsViewController = segue.destination as? ResultsViewController{
                resultsViewController.totalPerPerson = totalBillPerPerson
                resultsViewController.settings = "Split between \(numberOfSplits) people, with \((percentTip * 100.0))% tip."
            }
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

