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
        provider.fetchWeatherData().done { [weak self]  weatherData in
            guard let self = self else { return }
            self.weatherData.value = weatherData
        }.catch { error in
            print(error.localizedDescription)
        }
    }
}
