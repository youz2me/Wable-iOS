//
//  AccountRepository.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/23/25.
//


import Combine
import Foundation

protocol AccountRepository {
    func deleteAccount(reason: [String]) -> AnyPublisher<Void, Error>
    func fetchNicknameDuplication(nickname: String) -> AnyPublisher<Void, Error>
    func updateUserBadge(badge: Int) -> AnyPublisher<Void, Error>
}
