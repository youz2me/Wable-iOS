//
//  FetchUserNotificationInfos.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/16/25.
//

import Foundation

// MARK: - 유저에 해당하는 노티 리스트 조회

extension DTO.Response {
    struct FetchUserNotificationInfos: Decodable {
        let memberId: Int
        let memberNickname: String
        let triggerMemberNickname: String
        let triggerMemberProfileUrl: String
        let notificationTriggerType: String
        let time: String
        let notificationTriggerId: Int
        let notificationText: String
        let isNotificationChecked: Bool
        let isDeleted: Bool?
        let notificationId: Int?
        let triggerMemberId: Int?
        
        enum CodingKeys: String, CodingKey {
            case memberId = "memberID"
            case memberNickname, triggerMemberNickname
            case triggerMemberProfileUrl = "triggerMemberProfileURL"
            case notificationTriggerType, time
            case notificationTriggerId = "notificationTriggerID"
            case notificationText, isNotificationChecked, isDeleted
            case notificationId = "notificationID"
            case triggerMemberId = "triggerMemberID"
        }
    }
}

