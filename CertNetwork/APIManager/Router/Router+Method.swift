//
//  Router+Method.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 11/17/17.
//  Copyright © 2017 nextzy. All rights reserved.
//
import Alamofire

extension Router {
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .approveCert, .rejectCert:
            return .post
        default:
            return .get
        }
    }
}
