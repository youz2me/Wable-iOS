//
//  CommentLikedTargetType.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//

import Combine
import Foundation

import Moya

enum CommentLikedTargetType {
    case createCommentLiked(contentID: Int, request: DTO.Request.CreateCommentLiked)
    case deleteCommentLiked(commentID: Int)
}

extension CommentLikedTargetType: BaseTargetType {
    var feature: FeaturePath {
        return .commentLiked
    }
    
    var endPoint: String? {
        switch self {
        case .createCommentLiked(contentID: let contentID):
            return "/\(contentID)/liked"
        case .deleteCommentLiked(commentID: let commentID):
            return "/\(commentID)/unliked"
        }
    }
    
    var query: [String : Any]? {
        return .none
    }
    
    var requestBody: (any Encodable)? {
        switch self {
        case .createCommentLiked(contentID: let contentID, request: let request):
            return request
        default:
            return .none
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createCommentLiked:
            return .post
        case .deleteCommentLiked:
            return .delete
        }
    }
    
    
}
