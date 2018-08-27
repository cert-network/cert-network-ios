//
//  FirebaseManager.swift
//  wallet
//
//  Created by Patcharapon Joksamut on 10/7/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseManager {
    
    func requestOtp(phoneNumber: String, completion: @escaping (Error?) -> ()) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                completion(error)
                return
            }
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            completion(nil)
        }
    }
    
    func validateOtp(code: String, completion: @escaping (Error?)->()) {
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")!
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: code)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                // handle error
                completion(error)
                return
            }
            completion(nil)
        }
    }
}
