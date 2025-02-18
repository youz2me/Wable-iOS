//
//  ContentLikedTargetType.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//

import Combine
import Foundation

import Moya

enum ContentLikedTargetType {
    case createContentLiked(contentID: Int, request: DTO.Request.CreateContentLiked)
    case deleteContentLiked(contentID: Int)
}

extension ContentLikedTargetType: BaseTargetType {
    var feature: FeaturePath {
        return .contentLiked
    }
    
    var endPoint: String? {
        switch self {
        case .createContentLiked(contentID: let contentID):
            return "\(contentID)/liked"
        case .deleteContentLiked(contentID: let contentID):
            return "/\(contentID)/unliked"
        }
    }
    
    var query: [String : Any]? {
        return .none
    }
    
    var requestBody: (any Encodable)? {
        return .none
    }
    
    var method: Moya.Method {
        switch self {
        case .createContentLiked(contentID: let contentID, request: let request):
            return .post
        case .deleteContentLiked(contentID: let contentID):
            return .delete
        }
    }
}
