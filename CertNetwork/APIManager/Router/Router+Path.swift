//
//  Router+Path.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 11/20/17.
//  Copyright © 2017 nextzy. All rights reserved.
//


extension Router {
    //TODO
    public var path: String {
        switch self {
        case .approveCert:
            return "/api/cert/approve"
        case .rejectCert:
            return "/api/cert/reject"
        case .getCert:
            return "/api/cert/approver/\(HDWallet.shared.getAddress())"
        }
    }
}
