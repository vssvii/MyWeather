//
//  WeatherProvider.swift
//  MyWeather
//
//  Created by Developer on 11.12.2022.
//

import Foundation
import Moya
import Alamofire
import PromiseKit


class WeatherProvider {
    
    func fetchWeatherData() -> Promise<Weather> {
        return Promise<Weather> { seal in
            let provider = MoyaProvider<WeatherService>()
            provider.request(.fetchWeather) { object in
                print(object)
                guard let data = object as? Data else {
                    seal.reject(WeatherError.parsingError)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let weatherData = try decoder.decode(Weather.self, from: data)
                    print(weatherData)
                    seal.fulfill(weatherData)
                } catch (let error) {
                    print(error)
                }
            }
        }
        
    }
}

