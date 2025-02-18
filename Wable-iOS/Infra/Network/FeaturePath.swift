//
//  FeaturePath.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/19/25.
//


import Foundation

enum FeaturePath: String {
    case login, comment, content = ""
    case account, profile, ghost = "/v1"
    case commentLiked = "/v1/comment"
    case contentLiked = "v1/content"
    case notification = "v1/notification"
    case information = "v1/information"
}
