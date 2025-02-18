//
//  LoginTargetType.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//


import Combine

import Moya

enum LoginTargetType {}

extension LoginTargetType: TargetType {
    var baseURL: URL {
        return Bundle.BaseURL.debug
    }
    
    var path: String {
        <#code#>
    }
    
    var method: Moya.Method {
        <#code#>
    }
    
    var task: Moya.Task {
        <#code#>
    }
    
    var headers: [String : String]? {
        <#code#>
    }
    
    
}

