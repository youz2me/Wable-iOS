//
//  NotificationRepository.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//

import Combine
import Foundation

protocol NotificationRepository {
    func fetchInfoNotifications(cursor: Int) -> AnyPublisher<[InfoNotification], Error>
    func checkNotification() -> AnyPublisher<Void, Error>
    func fetchUserNotifications(cursor: Int) -> AnyPublisher<[ActivityNotification], Error>
    func fetchUncheckedNotificationNumber() -> AnyPublisher<Int, Error>
}
