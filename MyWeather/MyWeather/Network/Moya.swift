//
//  Moya.swift
//  MyWeather
//
//  Created by Developer on 17.01.2023.
//

import Moya


public func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data
    }
}

let logger = NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)

