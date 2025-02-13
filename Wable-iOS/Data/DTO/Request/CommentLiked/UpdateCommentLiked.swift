//
//  UpdateCommentLiked.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//

// MARK: - 답글 좋아요 버튼

extension DTO.Request {
    struct UpdateCommentLiked: Codable {
        let notificationTriggerType: String
        let targerMemberID: Int
        let alarmText: String
    }
}
