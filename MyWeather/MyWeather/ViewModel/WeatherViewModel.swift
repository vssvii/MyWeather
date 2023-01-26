//
//  WeatherViewModel.swift
//  MyWeather
//
//  Created by Developer on 12.12.2022.
//

import Foundation
import Bond

class WeatherViewModel: NSObject {
    
    
    let provider = WeatherProvider()
    var weatherData = Observable<Weather?>(nil)
    
    func getWeatherData() {
        provider.fetchWeatherData { result, error in
            if let err = error {
                print(err)
                return
            }
            self.weatherData.value = result
        }
    }
}
