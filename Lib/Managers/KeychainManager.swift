//
//  KeychainManager.swift
//  wallet
//
//  Created by Patcharapon Joksamut on 27/6/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
import Security
import UIKit

class KeychainManager: NSObject {
    
    static var encryptionKey = "encrptionKey.key"
    
    
    
    func save(string: String, toKey key: String) {
        let dataFromString = string.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        
        let query: [NSString: AnyObject] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key as AnyObject,
            kSecValueData: dataFromString as AnyObject]
        
        // Delete any existing items
        SecItemDelete(query as CFDictionary)
        
        // Add the new keychain item
        SecItemAdd(query as CFDictionary, nil)
    }
    
    func delete(key: String) {
        let query: [NSString: AnyObject] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key as AnyObject]
        
        // Delete any existing items
        SecItemDelete(query as CFDictionary)
        
    }
    
    func string(forKey key: String) -> String? {
        let query: [NSString: AnyObject] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key as AnyObject,
            kSecReturnData: kCFBooleanTrue,
            kSecMatchLimit: kSecMatchLimitOne]
        
        var dataTypeRef: AnyObject?
        
        // Search for the keychain items
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        var contentsOfKeychain: String? = nil
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                contentsOfKeychain = String(data: retrievedData, encoding: String.Encoding.utf8)
            }
        } else {
            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        
        return contentsOfKeychain
    }
    
    func deleteAllKey() {
        let listOfKeys = ["encrptionKey.key"]
        for key in listOfKeys {
            delete(key: key)
        }
    }
    
}
