//
//  DeleteAccount.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//

// MARK: - 계정 삭제

extension DTO.Request {
    struct DeleteAccount: Codable {
        let deletedReason: [String]
        
        enum CodingKeys: String, CodingKey {
            case deletedReason = "deleted_reason"
        }
    }
}
