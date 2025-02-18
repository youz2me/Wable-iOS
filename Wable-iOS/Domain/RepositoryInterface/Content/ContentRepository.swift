//
//  ContentRepository.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//


import Combine
import Foundation

protocol ContentRepository {
    func createContent(title: String, text: String, image: Data?) -> AnyPublisher<Void, Error>
    func deleteContent(contentID: String) -> AnyPublisher<Void, Error>
    func fetchContentInfo(contentID: String) -> AnyPublisher<ContentInfo, Error>
    func fetchContentList(cursor: Int) -> AnyPublisher<[Content], Error>
    func fetchUserContentList(cursor: Int) -> AnyPublisher<[UserContent], Error>
}
