//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }


}

//MARK: - UIPickerData Source
extension ViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    

}
//MARK: - UIPickerDelegate
extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row : Int, forComponent component: Int) -> String?{
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row : Int, inComponent component: Int) {
//        print("This is the row from the selector \(row)")
//        print(coinManager.currencyArray[row])
        let curr = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: curr)
    }

}

//MARK: - CoinManager Delegate

extension ViewController : CoinManagerDelegate{
    func didUpdateCoinPrice(_ coinManager: CoinManager, coin : CoinModel){
        print("did update was triggered")
        DispatchQueue.main.async {
            print("here is the rate of a coin\(coin.rate)")
            self.bitcoinLabel.text = String(format: "%.2f",coin.rate)
            self.currencyLabel.text = coin.currency
        }
    }
    
    func didFailWithError(_ coinManager: CoinManager, error: Error) {
        print("Error from coin manager delegate \(error)")
    }
    
    
}


