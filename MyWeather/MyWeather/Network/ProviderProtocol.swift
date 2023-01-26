//
//  ProviderProtocol.swift
//  MyWeather
//
//  Created by Developer on 17.01.2023.
//

import Foundation
import Moya
import PromiseKit
import class Alamofire.SessionManager
import class Alamofire.ServerTrustPolicyManager
import enum Alamofire.ServerTrustPolicy
import enum Result.Result

protocol ProviderProtocol {

}

public typealias JSON = [String: Any]

class Provider: ProviderProtocol {

    enum ContentType {
        case json
        case plain
    }

    lazy var manager : SessionManager = {

        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "api.weather.yandex.ru": .disableEvaluation
        ]

        // Create manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 60
        let policyManager = ServerTrustPolicyManager(policies: serverTrustPolicies)

        let sessionManager = SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: policyManager)

//        let url = URL(string: Constant.API.mGovUrl)!
//        sessionManager.session.configuration.httpCookieStorage?.setCookies(CookieManager.appCookies, for: url, mainDocumentURL: nil)

        return sessionManager
    }()
}
