//
//  FetchContents.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//


import Foundation

// MARK: - 게시물 상세 조회, 게시물 리스트 조회 (배열), 멤버에 해당하는 게시물 리스트 조회 (배열)
///
/// 게시물 리스트 조회 및 멤버에 해당하는 게시물 리스트 조회의 경우
/// data: [FetchContent]와 같이 사용해야 합니다.
///

extension DTO.Response {
    struct FetchContents: Decodable {
        let memberID: Int
        let memberProfileURL, memberNickname: String
        let isGhost: Bool
        let memberGhost: Int
        let isLiked: Bool
        let time: String
        let likedNumber, commentNumber: Int
        let message: String
        let contentImageURL: String
        let memberFanTeam: String
        let isBlind: Bool?
        
        enum CodingKeys: String, CodingKey {
            case memberID = "memberId"
            case memberProfileURL = "memberProfileUrl"
            case memberNickname
            case time, isGhost, memberGhost, isLiked, likedNumber, commentNumber, message
            case contentImageURL = "contentImageUrl"
            case memberFanTeam, isBlind
        }
    }
}
