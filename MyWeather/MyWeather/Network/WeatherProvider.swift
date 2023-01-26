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
import CommonCrypto


class WeatherProvider: Provider {
    
    
    
    func fetchWeatherData(completion: @escaping ((Weather?, Error?) -> Void)) {
        let params: [String: Any] = ["lat": 51.169392,
                      "lon": 71.449074,
                      "extra": true]

        let headers = [
            "X-Yandex-API-Key": "2cba68e2-7ff9-4f5c-97cc-71edb132053b"
        ]
        Alamofire.request("https://api.weather.yandex.ru/v1/forecast", method: .get,
                          parameters: params,
                          encoding: URLEncoding.queryString,
                          headers: headers)
        .validate()
        .responseJSON { response in

            switch (response.result) {

            case .success:

                do {
                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let weather = try decoder.decode(Weather.self, from: response.data!)
                    completion(weather, nil)
                } catch let error as NSError {
                    completion(nil, error)
                    print(String(describing: error))
                }

            case .failure(let error):
                print("Request error: \(error.localizedDescription)")
            }
        }
    }
}

