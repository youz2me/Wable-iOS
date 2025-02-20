//
//  InformationRepositoryImpl.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//

import Combine
import Foundation

final class InformationRepositoryImpl: InformationRepository {
    private let provider: APIProvider<InformationTargetType>
    
    init(provider: APIProvider<InformationTargetType> = .init()) {
        self.provider = provider
    }
    
    func fetchGameSchedules() -> AnyPublisher<[GameSchedule], Error> {
        return provider.request(
            .fetchGameSchedules,
            for: [DTO.Response.FetchGameSchedules].self
        )
        .map(InformationMapper.toDomain(_:))
        .normalizeError()
        .eraseToAnyPublisher()
    }
    
    func fetchGameCategory() -> AnyPublisher<String, Error> {
        return provider.request(
            .fetchGameCategory,
            for: DTO.Response.FetchGameCategory.self
        )
        .map { $0.lckGameType }
        .normalizeError()
        .eraseToAnyPublisher()
    }
    
    func fetchTeamRanks() -> AnyPublisher<[LCKTeamRank], Error> {
        return provider.request(
            .fetchTeamRanks,
            for: [DTO.Response.FetchLCKTeamRankings].self
        )
        .map(InformationMapper.toDomain(_:))
        .normalizeError()
        .eraseToAnyPublisher()
    }
    
    func fetchNewsNoticeNumber() -> AnyPublisher<(newsNumber: Int, noticeNumber: Int), Error> {
        return provider.request(
            .fetchNewsNoticeNumber,
            for: DTO.Response.FetchNewsNoticeNumber.self
        )
        .map { ($0.newsNumber, $0.noticeNumber) }
        .normalizeError()
        .eraseToAnyPublisher()
    }
    
    func fetchNews(cursor: Int) -> AnyPublisher<[Announcement], Error> {
        return provider.request(
            .fetchNews(cursor: cursor),
            for: [DTO.Response.FetchNews].self
        )
        .map(InformationMapper.toDomain(_:))
        .normalizeError()
        .eraseToAnyPublisher()
    }
    
    func fetchNotice(cursor: Int) -> AnyPublisher<[Announcement], Error> {
        return provider.request(
            .fetchNotices(cursor: cursor),
            for: [DTO.Response.FetchNotices].self
        )
        .map(InformationMapper.toDomain(_:))
        .normalizeError()
        .eraseToAnyPublisher()
    }
}
