//
//  Router+URLRequest.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 11/22/17.
//  Copyright © 2017 nextzy. All rights reserved.
//

import Alamofire

extension Router {
    public func asURLRequest() throws -> URLRequest {
        let url = URL(string: urlPath)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = Data()
        setHttpHeaders(urlRequest: &urlRequest, headers: headers)
        
        
        if method == .get {
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
        } else {
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }

    public func setHttpHeaders(urlRequest: inout URLRequest, headers: [String: String]?) {
        addDefaultHttpHeader(urlRequest: &urlRequest)
        if let headers = headers {
            for each in headers.keys {
                urlRequest.setValue(headers[each], forHTTPHeaderField: each)
            }
        }
    }
    
    public func addDefaultHttpHeader(urlRequest: inout URLRequest) {
        urlRequest.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("authorization", forHTTPHeaderField: "x-client-channel")
////        urlRequest.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGVObyI6IjA4OTQ2NjU4NDgiLCJkYXRlIjoiMjAxOC0wNy0xOVQwODozMjowOS4wNzNaIiwiaWF0IjoxNTMxOTg5MTI5LCJleHAiOjE1OTkxMjE5Mjl9.MV434oddUlLxDQ0KEhDPvgWmcy1tPerVm9MS4pY0Tr4", forHTTPHeaderField: "authorization")
//        if let apiKey = KeychainManager().string(forKey: KeychainManager.tokenKey) {
//            urlRequest.setValue(apiKey, forHTTPHeaderField: "authorization")
//        }
//        
    }
}
