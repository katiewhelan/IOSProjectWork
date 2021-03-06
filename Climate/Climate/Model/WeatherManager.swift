

import Foundation
import CoreLocation

protocol WeatherManagerDelegate{
    func didUpdateWeather (_ weatherManager: WeatherManager, weather : WeatherModel)
    func didFailWithError(error : Error)
}


struct WeatherManager{
    var apiKey = ""// get your api key from https://openweathermap.org/
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=imperial"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName : String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude : CLLocationDegrees, longitude : CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    
    //Option 1
    //    func performRequest(urlString: String ){
    //        //1:Create a URL
    //        if let url = URL(string: urlString){
    //            //2: Create a URL Session
    //            let session = URLSession(configuration: .default)
    //            //3: Give the Session a taskresponse:
    //            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
    //            //4: Start the task
    //            task.resume()
    //        }
    //    }
    //
    //    func handle(data : Data?, response:URLResponse?, error: Error?){
    //
    //        if error != nil{
    //            print(error)
    //            return
    //        }
    //        if let safeData = data {
    //            let dataString = String(data: safeData, encoding: .utf8)
    //            print(dataString)
    //        }
    //    }
    
    
    //Option 2 --> Using Closure
    
    func performRequest(with urlString : String ){
        //1:Create a URL
        if let url = URL(string: urlString){
            //2: Create a URL Session
            let session = URLSession(configuration: .default)
            //3: Give the Session a taskresponse:
            let task = session.dataTask(with: url) { (data, response , error) in
                
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather : weather)
                    }
                }
            }
            //4: Start the task
            task.resume()
        }
    }
    func parseJSON(_ weatherData: Data)  -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(condtionId: id, cityName: name, temperature: temp)
            return weather
        } catch {
                self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
