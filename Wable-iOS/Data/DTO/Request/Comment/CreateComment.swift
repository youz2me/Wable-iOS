//
//  CreateComment.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//

// MARK: - 답글 작성

extension DTO.Request {
    struct CreateComment: Codable {
        let commentText: String
        let parentCommentId: Int
        let parentCommentWriterId: Int
    }
}
