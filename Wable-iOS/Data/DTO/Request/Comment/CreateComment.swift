//
//  CreateComment.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//


import Foundation

// MARK: - 답글 작성

extension DTO.Request {
    struct CreateComment: Encodable {
        let commentText: String
        let parentCommentId: Int
        let parentCommentWriterId: Int
    }
}
