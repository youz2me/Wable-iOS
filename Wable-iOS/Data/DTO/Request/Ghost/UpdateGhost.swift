//
//  UpdateGhost.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//

// MARK: 투명도 낮추기 버튼

extension DTO.Request {
    struct UpdateGhost: Codable {
        let alarmTriggerType: String
        let targetMemberID, alarmTriggerID: Int
        let ghostReason: String
        
        enum CodingKeys: String, CodingKey {
            case alarmTriggerType
            case targetMemberID = "targetMemberId"
            case alarmTriggerID = "alarmTriggerId"
            case ghostReason
        }
    }
}
