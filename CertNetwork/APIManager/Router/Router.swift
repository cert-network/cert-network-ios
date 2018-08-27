//
//  Router.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 11/20/17.
//  Copyright © 2017 nextzy. All rights reserved.
//

import Alamofire

public protocol BaseRouter: URLRequestConvertible {
    var apiUrl: String { get }
    var method: Alamofire.HTTPMethod { get }
    var path: String { get }
    var headers: [String: String]? { get }
}

public enum Router: BaseRouter {
    case getCert
    case approveCert(address: String, privateKey: String, category: String, name: String, certId: String)
    case rejectCert(address: String, privateKey: String, category: String, name: String, certId: String)
}

extension Router {
    public var headers: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
    
    public var apiUrl: String {
        switch self {
        default:
            return Constants.environment.apiEndPoint
        }
    }
    
    var urlPath: String {
        return apiUrl + path
    }
    
}

