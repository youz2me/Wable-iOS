//
//  ContentLikedRepository.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//


import Combine
import Foundation

protocol ContentLikedRepository {
    func fetchContentLiked(contentID: Int, triggerType: String) -> AnyPublisher<Void, Never>
    func deleteContentLiked(contentID: Int) -> AnyPublisher<Void, Never>
}
