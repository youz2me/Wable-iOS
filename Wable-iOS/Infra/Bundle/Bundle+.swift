//
//  Bundle+.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/18/25.
//

import Foundation

extension Bundle {
    static let baseURL: String = main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
}
