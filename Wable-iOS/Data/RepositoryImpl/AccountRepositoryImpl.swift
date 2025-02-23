//
//  AccountRepositoryImpl.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/23/25.
//


import Combine
import Foundation

import CombineMoya
import Moya

final class AccountRepositoryImpl {
    private let provider = APIProvider<AccountTargetType>()
}

extension AccountRepositoryImpl: AccountRepository {
    func deleteAccount(reason: [String]) -> AnyPublisher<Void, any Error> {
        return provider.request(
            .deleteAccount(
                request: DTO.Request.DeleteAccount(
                    deletedReason: reason
                )
            ),
            for: DTO.Response.Empty.self
        )
        .asVoidWithError()
    }
    
    func fetchNicknameDuplication(nickname: String) -> AnyPublisher<Void, any Error> {
        return provider.request(
            .fetchNicknameDuplication(nickname: nickname),
            for: DTO.Response.Empty.self
        )
        .asVoidWithError()
    }
    
    func updateUserBadge(badge: Int) -> AnyPublisher<Void, any Error> {
        return provider.request(
            .updateUserBadge(badge: badge),
            for: DTO.Response.Empty.self
        )
        .asVoidWithError()
    }
}
