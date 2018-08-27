//
//  BaseResponse.swift
//  wallet
//
//  Created by Thongpak on 12/6/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation

class BaseResponse: NSObject, Decodable {
    var statusCode: Int?
    var error: String?
    var message: String?
}

class BaseError: NSError {
    
    public var resultCode: String {
        get {
            if let message = self.userInfo["statusCode"] as? String {
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
            return "Error"//PopupAlert.API_ERROR_MAIN.getMessage()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        let userInfo = [
            "message": message
        ]
        super.init(domain: Constants.environment.apiEndPoint, code: 0, userInfo: userInfo)
    }
    
    init(message: String, resultCode: Int) {
        let userInfo = [
            "message": message,
            "resultCode": resultCode
            ] as [String : Any]
        super.init(domain: Constants.environment.apiEndPoint, code: 0, userInfo: userInfo)
    }
}
