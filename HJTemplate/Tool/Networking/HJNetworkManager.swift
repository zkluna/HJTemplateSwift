//
//  HJNetworkManager.swift
//  HJSwiftTemplate
//
//  Created by rubick on 2018/12/20.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import SwiftyJSON
import HandyJSON

enum HJNetworkError : Error {
    case NetworkReachabilityError
    case NetworkResponseError
    case NetUnexceptError
    var localizedDescription: String {
        var desc = ""
        switch self {
        case .NetworkReachabilityError:
            desc = "No network connect"
        case .NetworkResponseError:
            desc = "Response Error"
        default:
            desc = "Some thing error unexcepted"
        }
        return "ErrorMsg : \(desc)"
    }
}

typealias successClosure = ((Dictionary<String, Any>) -> (Void))
typealias failureClosure = ((String, HJNetworkError) -> (Void))

let hjProvider = MoyaProvider<ApiServices>(endpointClosure: myEndpointClosure, requestClosure: myRequestClosure, plugins: [myNetworkActivityPlugin, myNetworkLoggerPlugin])

var isNetworkConnect: Bool {
    get {
        let reachability = NetworkReachabilityManager()
        return reachability?.isReachable ?? true
    }
}

func HJNetWorkRequest(_ target:ApiServices, completion: @escaping successClosure , failed: @escaping failureClosure) {
    if !isNetworkConnect {
        failed("No connect", .NetworkReachabilityError)
    }
    // show loading
    hjProvider.request(target) { (result) in
        switch result {
        case let .success(response):
            do {
                let jsonData = try JSON(data: response.data)
                let resultData = jsonData.dictionary
                completion(resultData!)
            } catch {
                failed("json decode error", .NetUnexceptError)
            }
        case let .failure(error):
            failed(error.localizedDescription, .NetworkResponseError)
        }
    }
}

// 数组转json
struct JSONArrayEncoding: ParameterEncoding {
    static let `default` = JSONArrayEncoding()
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        guard let json = parameters?["jsonArray"] else {
            return request
        }
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        if request.value(forHTTPHeaderField: "Content-Type") == nil {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        request.httpBody = data
        return request
    }
}

