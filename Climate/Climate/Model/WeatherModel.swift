//
//  WeatherModel.swift
//  Clima
//
//  Created by Kathryn Whelan on 2/16/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let condtionId : Int
    let cityName : String
    let temperature : Double
    
    var temperatureString : String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName : String {
        switch condtionId {
        case 200...232://include 200 - 232
            return "cloud.bolt"
        case 300...321://300 - 321
            return "cloud.drizzle"
        case 500...531://include 500 - 531
            return "cloud.rain"
        case 600...621://600 - 622
            return "cloud.snow"
        case 700...781://700-0781
            return "cloud.fog"
        case 800://include 800
            return "sun.max"
        case 801...804://801-804
            return"cloud.bolt"
        default:
            return "cloud"
        }
    }
}
