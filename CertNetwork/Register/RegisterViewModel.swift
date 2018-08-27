//
//  RegisterViewModel.swift
//  wallet
//
//  Created by Thongpak on 26/6/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
import LocalAuthentication
import RxSwift
import RxCocoa
import FirebaseAuth

class RegisterViewModel: NSObject {
    
    let keychainManager = KeychainManager()
    let firebaseManager = FirebaseManager()
//    let userManager = UserManager()
    
    var email: String?
    var phoneNumber: String?
    var countryCode: String?
    var passcode: String?
    var mnemonic: String?
    
    var errorRelay: BehaviorRelay<Error?> = BehaviorRelay(value: nil)
    
    func confirmPassCode(passcode: String) -> Bool {
        return passcode == self.passcode
    }


    func requestOtp(phoneNumber: String, completion: @escaping () -> ()) {
        firebaseManager.requestOtp(phoneNumber: phoneNumber) { (error) in
            if let error = error {
                self.errorRelay.accept(error)
                return
            }
            completion()
        }
    }
    
    func validateOtp(code: String, completion: @escaping ()->()) {
        firebaseManager.validateOtp(code: code) { (error) in
            if let error = error {
                self.errorRelay.accept(error)
                return
            }
            completion()
        }
    }
    
    func reset() {
        errorRelay = BehaviorRelay(value: nil)
    }
    
    
    func setLoginState(_ state: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(state, forKey: "isLoggedIn")
    }
    
    func clearInitialKeychainData() {
    }
}
