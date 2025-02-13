//
//  FetchUserProfile.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//


import Foundation

// MARK: - 유저 프로필 조회

extension DTO.Response {
    struct FetchUserProfile: Decodable {
        let memberID: Int
        let nickname, memberProfileURL, memberIntro: String
        let memberGhost: Int
        let memberFanTeam: String
        let memberLckYears, memberLevel: Int
        
        enum CodingKeys: String, CodingKey {
            case memberID = "memberId"
            case nickname
            case memberProfileURL = "memberProfileUrl"
            case memberIntro, memberGhost, memberFanTeam, memberLckYears, memberLevel
        }
    }
}
