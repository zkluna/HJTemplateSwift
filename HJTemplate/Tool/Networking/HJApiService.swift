//
//  HJApiService.swift
//  HJSwiftTemplate
//
//  Created by rubick on 2018/12/18.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import Moya

enum ApiServices {
    case homeTopData
    case homeInfo(channelId: Int)
    case searchInfo(keyword: String, sort: String)
}
extension ApiServices : TargetType {
    var baseURL: URL { return URL(string: kBASE_URL)! }
    var path: String {
        switch self {
        case .homeTopData:
            return "welcome"
        case .homeInfo(let channelId):
            return "user/\(channelId)"
        case .searchInfo(_, _):
            return "v1/search/item"
        }
    }
    var method: Moya.Method {
        switch self {
        case .homeTopData:
            return .get
        default:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .homeTopData:
            let params = ["gender":"1", "generation":"1"]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .homeInfo(_):
            let params = ["gender":1,"generation":1,"limit":20,"offset":0]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case let .searchInfo(keyword, sort):
            let params = ["keyword":keyword, "limit":20, "offset":0,"sort":sort] as [String : Any]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
    }
    //这个就是做单元测试模拟的数据
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    var headers: [String : String]? {
        return nil
    }
}
