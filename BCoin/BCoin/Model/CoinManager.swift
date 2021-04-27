//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
protocol CoinManagerDelegate {
    func didUpdateCoinPrice(_ coinManager : CoinManager, coin : CoinModel)
    func didFailWithError(_ coinManager : CoinManager, error:Error)
    
}

struct CoinManager {
    var delegate : CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    //https://docs.coinapi.io/#md-docs --> Get your Key here
    let apiKey = Constants.apiKey // "?yourApiKey"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var selectedCurrency = ""

    mutating func getCoinPrice(for currency : String){
//        print("String passed to coin manager \(currency)")
        let urlString = "\(baseURL)\(currency)\(apiKey)"
        selectedCurrency = currency
        performRequest(with:urlString)
    }
    
    
    func performRequest(with urlString: String){
        if let url = URL(string : urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url){(data, response, error) in
                
                if error != nil{
                    self.delegate?.didFailWithError(self, error: error!)
                    return
                }
                
                if let safeData = data {
                    if let coin = self.parseJSON(safeData){
                        print("json passed back data \(coin.rate)")
                        self.delegate?.didUpdateCoinPrice(self, coin : coin)
                    }
                }
            }
            task.resume()
        }
   
    }
    
    func parseJSON(_ coinData : Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            print("data \(rate)")
            let coin = CoinModel(rate : rate, currency : selectedCurrency)
            
            return coin
        }catch{
            self.delegate?.didFailWithError(self, error : error)
            return nil
        }
    }
    
    
}
