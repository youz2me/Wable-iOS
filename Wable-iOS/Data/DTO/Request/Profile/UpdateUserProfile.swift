//
//  UpdateUserProfile.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//


import Foundation

// MARK: - 유저 프로필 수정

extension DTO.Request {
    struct UpdateUserProfile: Encodable {
        let info: ProfileInfo?
        let file: Data?
    }
    
    struct ProfileInfo: Encodable {
        let nickname: String?
        let isAlarmAllowed: Bool?
        let memberIntro: String?
        let isPushAlarmAllowed: Bool?
        let fcmToken: String?
        let memberLckYears: Int?
        let memberFanTeam, memberDefaultProfileImage: String?
    }
}
