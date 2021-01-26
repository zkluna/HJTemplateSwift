//
//  HJApiProvider.swift
//  HJSwiftTemplate
//
//  Created by rubick on 2018/12/19.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import SwiftyJSON

// MARK: 设置 endpointClosure
let myEndpointClosure = { (target: TargetType) -> Endpoint in
    let url = target.baseURL.absoluteString + target.path
    /** 如果要加类似token参数 */
    /*
    var task = target.task
    let additionParameters = ["token" : "token code"]
    let defalutEncoding = URLEncoding.default
    switch target.task {
    case .requestPlain:
        task = .requestParameters(parameters: additionParameters, encoding: URLEncoding.default)
    case .requestParameters(var parameters, let encoding):
        additionParameters.forEach { parameters[$0.key] = $0.value }
        task = .requestParameters(parameters: parameters, encoding: encoding)
    default:
        break
    }
   */
    let endpoint: Endpoint = Endpoint(
        url: url,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) } ,
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
    )
    return endpoint
}

// MARK: 设置 requestClosure
let myRequestClosure = { (endpoint: Endpoint, closure: MoyaProvider.RequestResultClosure) -> Void in
    do {
        var urlRequest = try endpoint.urlRequest()
        urlRequest.timeoutInterval = 75
        closure(.success(urlRequest))
    } catch MoyaError.requestMapping(let url) {
        closure(.failure(MoyaError.requestMapping(url)))
    } catch MoyaError.parameterEncoding(let error) {
        closure(.failure(MoyaError.parameterEncoding(error)))
    } catch {
        closure(.failure(MoyaError.underlying(error, nil)))
    }
    // 模拟网络请求
    let myStubClosure:(TargetType) -> Moya.StubBehavior = { type in
        switch type {
        default:
            return Moya.StubBehavior.delayed(seconds: 1)
        }
    }
}

// MARK: ssl 设置
/*
let polocies: [String: ServerTrustPolicy] = [
    "example.com": .pinPublicKeys(
        publicKeys: ServerTrustPolicy.publicKeys(),
        validateCertificateChain: true,
        validateHost: true
    )
]
*/

// MARK: Moya默认的Manager还是Alamofire的Manager, HTTPS需要手动实现Manager
/*
func defaultAlamofireManager() -> Manager {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
    let sessionDelegate = Alamofire.SessionDelegate()
    let policies: [String : ServerTrustPolicy] = [
        "example.com" : .disableEvaluation
    ]
    let manager = Alamofire.SessionManager(configuration: configuration, delegate: sessionDelegate, serverTrustPolicyManager: ServerTrustPolicyManager(policies: policies))
    manager.startRequestsImmediately = false
    return manager
}
*/

// MARK: 设置 stub
//MoyaProvider.neverStub()
//MoyaProvider.immediatelyStub()
//MoyaProvider.delayedStub(0.1)

// MARK: plugin: Log loading等

// Loading plugin
let myNetworkActivityPlugin = NetworkActivityPlugin{ (changeType, target) in
    switch changeType {
    case .began:
        print("begin loading ------ ")
    case .ended:
        print("end loading -------- ")
    }
}
// Log plugin methods
func reversedPrint(_ separator: String, terminator: String, items: Any...){
    for item in items {
        print(item, separator: separator, terminator: terminator)
    }
}
func requestPrint(_ data: Data) -> String {
    let tempStr = String(data: data, encoding: String.Encoding.utf8)
    return tempStr!
}
func responseDataHandle(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON)
        return prettyData
    } catch {
        return data
    }
}
// Log plugin
let myNetworkLoggerPlugin = NetworkLoggerPlugin()

