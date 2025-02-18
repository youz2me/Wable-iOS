//
//  BaseTargetType.swift
//  Wable-iOS
//
//  Created by 김진웅 on 2/15/25.
//

import Foundation

import Moya

enum FeaturePath: String {
    case login, comment, content = ""
    case account, profile, ghost = "/v1"
    case commentLiked = "/v1/comment"
    case contentLiked = "v1/content"
    case notification = "v1/notification"
    case information = "v1/information"
}

protocol BaseTargetType: TargetType {
    var feature: FeaturePath { get }
    var endPoint: String? { get }
    var query: [String: Any]? { get }
    var requestBody: Encodable? { get }
}

extension BaseTargetType {
    var baseURL: URL {
        guard let url = URL(string: Bundle.baseURL)
        else {
            WableLogger.log("URL을 찾을 수 없습니다.", for: .error)
        }
        
        return url
    }
    
    var path: String {
        guard let url = endPoint
        else {
            return ""
        }
        
        return feature.rawValue + url
    }
    
    var task: Task {
        if let query {
            return .requestParameters(
                parameters: query,
                encoding: URLEncoding.default
            )
        }
        else if let requestBody {
            return .requestJSONEncodable(requestBody)
        }
        return .requestPlain
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var headers: [String : String]? {
        return .none
    }
}
