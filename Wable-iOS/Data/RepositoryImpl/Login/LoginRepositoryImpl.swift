//
//  LoginRepositoryImpl.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//


import Combine
import Foundation

import CombineMoya
import Moya


class LoginRepositoryImpl {
    let provider = MoyaProvider<LoginTargetType>()
    let decoder = JSONDecoder()
}

extension LoginRepositoryImpl: LoginRepository {
    func updateTokenStatus() -> AnyPublisher<Token, any Error> {
        return provider.requestPublisher(.fetchTokenStatus)
            .map(\.data)
            .decode(type: DTO.Response.UpdateToken.self, decoder: decoder)
            .tryMap { token in
                return Token(
                    accessToken: token.accessToken,
                    refreshToken: token.refreshToken
                )
            }
            .mapError {
                $0 as? WableNetworkError ?? .unknown($0)
            }
            .eraseToAnyPublisher()
    }
    
    func fetchUserAuth(platform: String, userName: String) -> AnyPublisher<Account, any Error> {
        return provider.requestPublisher(.fetchUserAuth(request: DTO.Request.CreateAccount(socialPlatform: platform, userName: userName)))
            .map(\.data)
            .decode(type: DTO.Response.CreateAccount.self, decoder: decoder)
            .tryMap {
                guard let url = URL(string: $0.memberProfileURL), let fanTeam = LCKTeam(rawValue: $0.memberFanTeam)
                else {
                    let context = DecodingError.Context(
                        codingPath: [],
                        debugDescription: "memberProfileURL 또는 memberFanTeam 값이 올바르지 않습니다."
                    )
                    throw WableNetworkError.decodedError(DecodingError.valueNotFound(String.self, context))
                }
                
                return Account(
                    user: User(
                        id: $0.memberID,
                        nickname: $0.nickName,
                        profileURL: url,
                        fanTeam: fanTeam
                    ),
                    token: Token(
                        accessToken: $0.accessToken,
                        refreshToken: $0.refreshToken
                    ),
                    userLevel: $0.memberLevel,
                    lckYears: $0.memberLCKYears,
                    isAdmin: $0.isAdmin,
                    isPushAlarmAllowed: $0.isPushAlarmAllowed,
                    isNewUser: $0.isNewUser
                )
            }
            .mapError {
                $0 as? WableNetworkError ?? .unknown($0)
            }
            .eraseToAnyPublisher()
    }
}
