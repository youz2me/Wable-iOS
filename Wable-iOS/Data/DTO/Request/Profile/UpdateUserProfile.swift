//
//  UpdateUserProfile.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//

// MARK: - 유저 프로필 수정

import Foundation

extension DTO.Request {
    struct UpdateUserProfile: Codable {
        let info: ProfileInfo?
        let file: Data?
    }
    
    struct ProfileInfo: Codable {
        let nickname: String?
        let isAlarmAllowed: Bool?
        let memberIntro: String?
        let isPushAlarmAllowed: Bool?
        let fcmToken: String?
        let memberLckYears: Int?
        let memberFanTeam, memberDefaultProfileImage: String?
    }
}
