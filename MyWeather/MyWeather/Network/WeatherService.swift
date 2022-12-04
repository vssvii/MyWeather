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
    case fetchWeather
}


extension WeatherService: TargetType {
    
        
    
    var baseURL: URL {
        switch self {
        case .fetchWeather:
            return URL(string: "api.weather.yandex.ru")!
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
        return .requestPlain
    }
//
    var headers: [String : String]? {
        return ["X-Yandex-API-Key": "fc7536be-00a0-485d-b849-cfdef578b1e3"]
    }
}
