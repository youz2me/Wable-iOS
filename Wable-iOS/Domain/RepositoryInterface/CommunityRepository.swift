//
//  CommunityRepository.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/23/25.
//


import Combine
import Foundation

protocol CommunityRepository {
    func updatePreRegister(communityName: LCKTeam) -> AnyPublisher<Void, Error>
    func fetchCommunityList() -> AnyPublisher<[Community], Error>
}
