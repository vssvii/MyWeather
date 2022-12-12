////
////  Provider.swift
////  MyWeather
////
////  Created by Developer on 11.12.2022.
////
//
//
//import Foundation
//import Moya
//import PromiseKit
//import class Alamofire.SessionManager
//import class Alamofire.ServerTrustPolicyManager
//import enum Alamofire.ServerTrustPolicy
//import enum Result.Result
//
//protocol ProviderProtocol {
//    
//}
//
//public typealias JSON = [String: Any]
//
//class Provider: ProviderProtocol {
//    
//    enum ContentType {
//        case json
//        case plain
//    }
//    
//    lazy var manager : SessionManager = {
//        
//        // Create the server trust policies
//        let serverTrustPolicies: [String: ServerTrustPolicy] = [
//            "https://api.weather.yandex.ru": .disableEvaluation
//        ]
//        
//        // Create manager
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
//        configuration.timeoutIntervalForRequest = 100
//        let policyManager = ServerTrustPolicyManager(policies: serverTrustPolicies)
//        
//        let sessionManager = SessionManager(
//            configuration: configuration,
//            serverTrustPolicyManager: policyManager)
//        
//        let url = URL(string: "https://api.weather.yandex.ru")!
//        sessionManager.session.configuration.httpCookieStorage?.setCookies(CookieManager.appCookies, for: url, mainDocumentURL: nil)
//        
//        return sessionManager
//    }()
//    
//    lazy var customManager : SessionManager = {
//        
//        // Create the server trust policies
//        let serverTrustPolicies: [String: ServerTrustPolicy] = [
//            "idp.egov.kz": .disableEvaluation,
//            "egov.kz": .disableEvaluation,
//            "m.egov.kz": .disableEvaluation,
//            "test.my.egov.kz": .disableEvaluation,
//            "195.12.114.235": .disableEvaluation,
//            "test.idp.egov.kz": .disableEvaluation,
//            "test-idp.egov.kz": .disableEvaluation,
//            "195.12.113.17": .disableEvaluation,
//            "91.203.227.74": .disableEvaluation,
//            "api.otbasybank.kz": .disableEvaluation
//        ]
//        
//        // Create manager
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
//        configuration.timeoutIntervalForRequest = 60
//        let policyManager = ServerTrustPolicyManager(policies: serverTrustPolicies)
//        
//        let sessionManager = SessionManager(
//            configuration: configuration,
//            serverTrustPolicyManager: policyManager)
//        
//        let url = URL(string: Constant.API.mGovUrl)!
//        sessionManager.session.configuration.httpCookieStorage?.setCookies(CookieManager.appCookies, for: url, mainDocumentURL: nil)
//        
//        return sessionManager
//    }()
//    
//    public func request<T: TargetType>(provider: MoyaProvider<T>, targetType: T, contentType: ContentType = .json) -> Promise<Any>{
//        return Promise<Any> { seal in
//            provider.request(targetType) {
//                do {
//                    let data = try self.handleResult($0)
//                    if (contentType == .json) {
//                        let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                        seal.fulfill(object)
//                    } else {
//                        seal.fulfill(data)
//                    }
//                } catch let error {
//                    Crashlytics.crashlytics().record(error: error)
//                    seal.reject(error)
//                }
//            }
//        }
//    }
//    
//    public func handleResult(_ result: Result<Moya.Response, MoyaError>) throws -> Data {
//        if let statusCode = try? result.get().statusCode, statusCode == 401 {
//            Session.shared.sessionExpired()
//        }
//
//        switch result {
//        case let .success(response):
//            print("Requested URL: \(String(describing: response.request))")
//            return response.data
//        case let .failure(error):
//            throw error
//        }
//    }
//    
//    public func handleParseResponse(_ object: JSON) -> [JSON]? {
//        guard let results = object["results"] as? [JSON] else {
//            return nil
//        }
//        return results
//    }
//}
//
