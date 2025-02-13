//
//  CreateContent.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//

// MARK: - 게시물 작성하기

import Foundation

extension DTO.Request {
    struct CreateContent: Codable {
        let text: Content
        let image: Data?
    }
    
    struct Content: Codable {
        let contentTitle: String
        let contentText: String
    }
}
