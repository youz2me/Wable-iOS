//
//  KeychainWrapper.swift
//  Wable-iOS
//
//  Created by YOUJIM on 2/15/25.
//


import Foundation
import Security

enum KeychainWrapper {
    static func save(_ data: Data, for service: KeychainService, account: Data) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service.rawValue,
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            throw KeychainError.saveFailed(status)
        }
    }
    
    static func load(for service: KeychainService, account: Data) throws -> Data {
        var item: AnyObject?
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service.rawValue,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess,
              let data = item as? Data
        else {
            throw KeychainError.dataNotFound(status)
        }
        
        return data
    }
    
    static func delete(for service: KeychainService, account: Data) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service.rawValue
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status != errSecSuccess {
            throw KeychainError.deleteFailed(status)
        }
    }
}
