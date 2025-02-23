//
//  ViewitRepository.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/23/25.
//


import Combine
import Foundation

protocol ViewitRepository {
    func deleteViewit(viewitID: Int) -> AnyPublisher<Void, Error>
    func deleteViewitLiked(viewitID: Int) -> AnyPublisher<Void, Error>
    func createViewitLiked(viewitID: Int) -> AnyPublisher<Void, Error>
    func fetchViewitList(cursor: Int) -> AnyPublisher<[Viewit], Error>
    func createViewitPost(thumbnailURL: URL, videoURL: URL, title: String, text: String) -> AnyPublisher<Void, Error>
}
