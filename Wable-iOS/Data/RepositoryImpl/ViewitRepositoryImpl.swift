//
//  ViewitRepositoryImpl.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/23/25.
//


import Combine
import Foundation

import CombineMoya
import Moya

final class ViewitRepositoryImpl {
    private let provider = APIProvider<ViewitTargetType>()
}

extension ViewitRepositoryImpl: ViewitRepository {
    func deleteViewit(viewitID: Int) -> AnyPublisher<Void, any Error> {
        return provider.request(
            .deleteViewit(viewitID: viewitID),
            for: DTO.Response.Empty.self
        )
        .asVoidWithError()
    }
    
    func deleteViewitLiked(viewitID: Int) -> AnyPublisher<Void, any Error> {
        return provider.request(
            .deleteViewitLiked(viewitID: viewitID),
            for: DTO.Response.Empty.self
        )
        .asVoidWithError()
    }
    
    func createViewitLiked(viewitID: Int) -> AnyPublisher<Void, any Error> {
        return provider.request(
            .createViewitLiked(viewitID: viewitID),
            for: DTO.Response.Empty.self
        )
        .asVoidWithError()
    }
    
    func fetchViewitList(cursor: Int) -> AnyPublisher<[Viewit], any Error> {
        return provider.request(
            .fetchViewitList(cursor: cursor),
            for: [DTO.Response.FetchViewits].self
        )
        .map(ViewitMapper.toDomain)
        .normalizeError()
    }
    
    func createViewitPost(
        thumbnailURL: URL,
        videoURL: URL,
        title: String,
        text: String
    ) -> AnyPublisher<Void, any Error> {
        return provider.request(
            .createViewitPost(
                request: DTO.Request.CreateViewitPost(
                    viewitImageURL: thumbnailURL.absoluteString,
                    viewitURL: videoURL.absoluteString,
                    viewitTitle: title,
                    viewitText: text
                )
            ),
            for: DTO.Response.Empty.self
        )
        .asVoidWithError()
    }
}
