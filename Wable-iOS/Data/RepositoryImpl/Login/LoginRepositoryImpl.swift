//
//  LoginRepositoryImpl.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//


import Combine

import CombineMoya
import Moya

class LoginRepositoryImpl {
//    let provider = MoyaProvider<>()
    
}

extension LoginRepositoryImpl: LoginRepository {
    func updateTokenStatus() -> AnyPublisher<Void, any Error> {
        <#code#>
    }
    
    func fetchUserAuth(platform: String, userName: String) -> AnyPublisher<Account, any Error> {
        <#code#>
    }
}
