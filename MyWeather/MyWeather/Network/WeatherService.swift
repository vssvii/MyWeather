//
//  WeatherService.swift
//  MyWeather
//
//  Created by Ibragim Assaibuldayev on 01.12.2022.
//

import Foundation
import Moya
import Alamofire


enum WeatherService {
    
    
    case fetchWeather(lat: Double, lon: Double, extra: Bool)
    
}


extension WeatherService: TargetType {
    
    var baseURL: URL {
        switch self {
        case .fetchWeather:
            return URL(string: "https://api.weather.yandex.ru")!
        }
    }
    
    var path: String {
        switch self {
        case .fetchWeather:
            return "v2/forecast"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchWeather:
            return .get
        }
    }
        
//
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchWeather(let lat, let lon, let extra):
            let params: [String: Any] = [
                "lat": lat,
                "lon": lon,
                "extra": extra
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
//
    var headers: [String : String]? {
        return ["X-Yandex-API-Key": "2cba68e2-7ff9-4f5c-97cc-71edb132053b"]
    }
}
