//
//  Router+Params.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 11/22/17.
//  Copyright © 2017 nextzy. All rights reserved.
//

extension Router {
    var parameters: [String: Any]? {
        switch self {
        case .approveCert(let params), .rejectCert(let params):
            return [
                "address": params.address,
                "category": params.category,
                "private": params.privateKey, //not recommend
                "name": params.name,
                "certId": params.certId
            ]
        default:
            return nil
        }
    }
}
