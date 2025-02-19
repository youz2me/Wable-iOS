//
//  ProfileRepositoryImpl.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/19/25.
//

import Combine
import Foundation

import CombineMoya
import Moya


class ProfileRepositoryImpl {
    let provider = APIProvider<ProfileTargetType>()
    let dateFormatter: DateFormatter
    let decoder = JSONDecoder()
    
    init() {
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "yyyy.MM.dd"
    }
}

extension ProfileRepositoryImpl: ProfileRepository {
    func fetchUserInfo() -> AnyPublisher<AccountInfo, any Error> {
        return provider.requestPublisher(.fetchUserInfo)
            .map(\.data)
            .decode(type: DTO.Response.FetchAccountInfo.self, decoder: decoder)
            .withUnretained(self)
            .tryMap {
                owner,
                info in
                guard let createdDate = owner.dateFormatter.date(from: info.joinDate),
                      let socialPlatform = SocialPlatform(rawValue: info.socialPlatform)
                else {
                    let context = DecodingError.Context(
                        codingPath: [],
                        debugDescription: "joinDate 또는 socialPlatform 값이 올바르지 않습니다."
                    )
                    throw WableNetworkError.decodedError(DecodingError.valueNotFound(String.self, context))
                }
                
                return AccountInfo(
                    memberID: info.memberID,
                    createdDate: createdDate,
                    displayMemberID: info.showMemberID,
                    socialPlatform: socialPlatform,
                    version: info.versionInformation
                )
            }
            .mapError {
                $0 as? WableNetworkError ?? .unknown($0)
            }
            .eraseToAnyPublisher()
    }
    
    func fetchUserProfile(memberID: Int) -> AnyPublisher<UserProfile, any Error> {
        return provider.requestPublisher(.fetchUserProfile(memberID: memberID))
            .map(\.data)
            .decode(type: DTO.Response.FetchUserProfile.self, decoder: decoder)
            .tryMap {
                guard let url = URL(string: $0.memberProfileURL), let fanTeam = LCKTeam(rawValue: $0.memberFanTeam)
                else {
                    let context = DecodingError.Context(
                        codingPath: [],
                        debugDescription: "memberProfileURL 또는 memberFanTeam 값이 올바르지 않습니다."
                    )
                    
                    throw WableNetworkError.decodedError(DecodingError.valueNotFound(String.self, context))
                }
                
                return UserProfile(
                    user: User(
                        id: $0.memberID,
                        nickname: $0.nickname,
                        profileURL: url,
                        fanTeam: fanTeam
                    ),
                    introduction: $0.memberIntro,
                    ghostCount: $0.memberGhost,
                    lckYears: $0.memberLCKYears,
                    userLevel: $0.memberLevel
                )
            }
            .mapError {
                $0 as? WableNetworkError ?? .unknown($0)
            }
            .eraseToAnyPublisher()
    }
    
    // TODO: 엔티티가 이상한데 확인하기
    
    func updateUserProfile(profile: UserProfile) -> AnyPublisher<Void, any Error> {
        return provider.requestPublisher(
            .updateUserProfile(
                request: DTO.Request.UpdateUserProfile(
                    info: DTO.Request.ProfileInfo(
                        nickname: nil,
                        isAlarmAllowed: nil,
                        memberIntro: nil,
                        isPushAlarmAllowed: nil,
                        fcmToken: nil,
                        memberLCKYears: nil,
                        memberFanTeam: nil,
                        memberDefaultProfileImage: nil
                    ),
                    file: nil
                )
            )
        )
        .map { _ in () }
        .mapError {
            $0 as? WableNetworkError ?? .unknown($0)
        }
        .eraseToAnyPublisher()
    }
}
