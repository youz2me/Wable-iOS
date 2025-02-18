//
//  CommentLikedRepository.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//


import Combine
import Foundation

protocol CommentLikedRepository {
    func createCommentLiked(contentID: Int, triggerType: String) -> AnyPublisher<Bool, Error>
    func deleteCommentLiked(commentID: Int) -> AnyPublisher<Void, Error>
}
