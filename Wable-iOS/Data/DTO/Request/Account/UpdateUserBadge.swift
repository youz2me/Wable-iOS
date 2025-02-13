//
//  UpdateUserBadge.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//


import Foundation

// MARK: - 유저 배지값 수정

extension DTO.Request {
    struct UpdateUserBadge: Encodable {
        let memberID: Int
        let joinDate, showMemberID, socialPlatform, versionInformation: String
        
        enum CodingKeys: String, CodingKey {
            case memberID = "memberId"
            case joinDate
            case showMemberID = "showMemberId"
            case socialPlatform, versionInformation
        }
    }
}
