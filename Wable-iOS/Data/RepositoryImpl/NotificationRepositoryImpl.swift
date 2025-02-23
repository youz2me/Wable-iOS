//
//  NotificationRepositoryImpl.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//

import Combine
import Foundation

final class NotificationRepositoryImpl: NotificationRepository {
    private let provider: APIProvider<NotificationTargetType>
    
    init(provider: APIProvider<NotificationTargetType> = .init()) {
        self.provider = provider
    }
    
    func fetchInfoNotifications(cursor: Int) -> AnyPublisher<[InfoNotification], Error> {
        return provider.request(
            .fetchInfoNotifications(cursor: cursor),
            for: [DTO.Response.FetchInfoNotifications].self
        )
        .map(NotificationMapper.toDomain(_:))
        .normalizeError()
        .eraseToAnyPublisher()
    }
    
    func checkNotification() -> AnyPublisher<Void, Error> {
        return provider.request(
            .checkNotification,
            for: DTO.Response.Empty.self
        )
        .asVoidWithError()
        .eraseToAnyPublisher()
    }
    
    func fetchUserNotifications(cursor: Int) -> AnyPublisher<[ActivityNotification], Error> {
        return provider.request(
            .fetchUserNotifications(cursor: cursor),
            for: [DTO.Response.FetchUserNotifications].self
        )
        .map(NotificationMapper.toDomain(_:))
        .normalizeError()
        .eraseToAnyPublisher()
    }
    
    func fetchUncheckedNotificationNumber() -> AnyPublisher<Int, Error> {
        return provider.request(
            .fetchUncheckedNotificationNumber,
            for: DTO.Response.FetchNotificationNumber.self
        )
        .map { $0.notificationNumber }
        .normalizeError()
        .eraseToAnyPublisher()
    }
}
