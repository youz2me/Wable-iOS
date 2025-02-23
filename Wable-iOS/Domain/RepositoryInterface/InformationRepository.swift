//
//  InformationRepository.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//

import Combine
import Foundation

protocol InformationRepository {
    func fetchGameSchedules() -> AnyPublisher<[GameSchedule], Error>
    func fetchGameCategory() -> AnyPublisher<String, Error>
    func fetchTeamRanks() -> AnyPublisher<[LCKTeamRank], Error>
    func fetchNewsNoticeNumber() -> AnyPublisher<(newsNumber: Int, noticeNumber: Int), Error>
    func fetchNews(cursor: Int) -> AnyPublisher<[Announcement], Error>
    func fetchNotice(cursor: Int) -> AnyPublisher<[Announcement], Error>
}
