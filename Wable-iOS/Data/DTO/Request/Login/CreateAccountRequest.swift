//
//  CreateAccount.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/13/25.
//

// MARK: - 소셜 로그인 및 회원가입

extension DTO.Request {
    struct CreateAccount: Codable {
        let socialPlatform: String
        let userName: String?
    }
}
