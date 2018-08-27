//
//  WalletError.swift
//  wallet
//
//  Created by Thongpak on 12/6/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
public class WalletError: NSError {
    private let walletErrorDomain: String = "WalletError"
    private let walletErrorCode: Int = 0
    
    public var resultCode: String {
        get {
            if let message = self.userInfo["resultCode"] as? String {
                return message
            }
            return ""
        }
    }
    
    public var message: String {
        get {
            if let message = self.userInfo["message"] as? String {
                return message
            }
            return "Error"
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        let userInfo = [
            "message": message
        ]
        super.init(domain: walletErrorDomain, code: walletErrorCode, userInfo: userInfo)
    }
    
    init(message: String, resultCode: String) {
        let userInfo = [
            "message": message,
            "resultCode": resultCode
        ]
        super.init(domain: walletErrorDomain, code: walletErrorCode, userInfo: userInfo)
    }
}
