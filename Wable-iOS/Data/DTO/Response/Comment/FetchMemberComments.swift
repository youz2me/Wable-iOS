//
//  FetchMemberComment.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//


import Foundation

// MARK: - 멤버에 해당하는 답글 리스트 조회

/// data: [FetchMemberComment]와 같이 사용해야 합니다.
///

extension DTO.Response {
    struct FetchMemberComments: Decodable {
        let memberID: Int
        let memberProfileURL, memberNickname: String
        let isLiked, isGhost: Bool
        let memberGhost, commentLikedNumber: Int
        let commentText, time: String
        let commentID, contentID: Int
        let commentImageURL: String?
        let memberFanTeam: String
        let isBlind: Bool?
        
        enum CodingKeys: String, CodingKey {
            case memberID = "memberId"
            case memberProfileURL = "memberProfileUrl"
            case memberNickname, isLiked, isGhost, memberGhost, commentLikedNumber, commentText, time
            case commentID = "commentId"
            case contentID = "contentId"
            case commentImageURL = "commentImageUrl"
            case memberFanTeam, isBlind
        }
    }
}
