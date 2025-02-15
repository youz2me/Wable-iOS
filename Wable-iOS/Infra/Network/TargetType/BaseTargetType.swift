//
//  BaseTargetType.swift
//  Wable-iOS
//
//  Created by 김진웅 on 2/15/25.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    var baseURL: URL {
        
        // TODO: 추후 BaseURL 수정 요망
        
        guard let url = URL(string: "https://wable.example.com") else {
            fatalError("Base URL must be set.")
        }
        return url
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
