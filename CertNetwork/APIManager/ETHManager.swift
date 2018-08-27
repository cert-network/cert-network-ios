//
//  ETHManager.swift
//  wallet
//
//  Created by Patcharapon Joksamut on 26/7/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
import Alamofire

protocol CertManagersType {
    func getCert(completion: @escaping (_ result: CertResponse) -> (), failure: @escaping (_ error: BaseError) -> ()) -> Request?
    func rejectCert(address: String, privateKey: String, category: String, name: String, certId: String, completion: @escaping (_ result: BaseResponse) -> (), failure: @escaping (_ error: BaseError) -> ()) -> Request?
    func approveCert(address: String, privateKey: String, category: String, name: String, certId: String, completion: @escaping (_ result: BaseResponse) -> (), failure: @escaping (_ error: BaseError) -> ()) -> Request?
}

class CertManager: CertManagersType {
    
    func getCert(completion: @escaping (CertResponse) -> (), failure: @escaping (BaseError) -> ()) -> Request? {
        let router = Router.getCert
        return APIManager.request(withRouter: router, responseType: CertResponse.self, completion: { (response) in
            completion(response)
        }, failure: { (error) in
            failure(error)
        })
    }
    
    func rejectCert(address: String, privateKey: String, category: String, name: String, certId: String, completion completion: @escaping (BaseResponse) -> (), failure: @escaping (BaseError) -> ()) -> Request? {
        let router = Router.rejectCert(address: address, privateKey: privateKey, category: category, name: name, certId: certId)
        return APIManager.request(withRouter: router, responseType: BaseResponse.self, completion: { (response) in
            completion(response)
        }, failure: { (error) in
            failure(error)
        })
    }
    
    func approveCert(address: String, privateKey: String, category: String, name: String, certId: String, completion: @escaping (BaseResponse) -> (), failure: @escaping (BaseError) -> ()) -> Request? {
        let router = Router.approveCert(address: address, privateKey: privateKey, category: category, name: name, certId: certId)
        return APIManager.request(withRouter: router, responseType: BaseResponse.self, completion: { (response) in
            completion(response)
        }, failure: { (error) in
            failure(error)
        })
    }
    
}

