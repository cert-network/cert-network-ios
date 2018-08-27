//
//  ApproveViewModel.swift
//  CertNetwork
//
//  Created by Thongpak on 26/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
import RxSwift

class ApproveViewModel {
    var approveList = [CertDetail]()
    func getCert() -> Observable<String> {
        return Observable.create({ (observer) -> Disposable in
            let request = CertManager().getCert(completion: { (response) in
                self.approveList = response.certs
                observer.onNext(response.message ?? "")
            }, failure: { (error) in
                observer.onError(error)
            })
            return Disposables.create {
                request?.cancel()
            }
        })
    }
    
    func approve(address: String, privateKey: String, category: String, name: String, certId: String) -> Observable<String> {
        return Observable.create({ (observer) -> Disposable in
            let request = CertManager().approveCert(address: address, privateKey: privateKey, category: category, name: name, certId: certId, completion: { (response) in
                observer.onNext(response.message ?? "")
            }, failure: { (error) in
                observer.onError(error)
            })
            return Disposables.create {
                request?.cancel()
            }
        })
    }
    
    func reject(address: String, privateKey: String, category: String, name: String, certId: String) -> Observable<String> {
        return Observable.create({ (observer) -> Disposable in
            let request = CertManager().rejectCert(address: address, privateKey: privateKey, category: category, name: name, certId: certId, completion: { (response) in
                observer.onNext(response.message ?? "")
            }, failure: { (error) in
                observer.onError(error)
            })
            return Disposables.create {
                request?.cancel()
            }
        })
    }
}
