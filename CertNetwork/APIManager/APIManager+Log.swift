//
//  APIManager+Log.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 11/22/17.
//  Copyright © 2017 nextzy. All rights reserved.
//
import Alamofire

extension DataRequest {
    public func logRequest() -> DataRequest {
        guard let request = self.request, Constants.environment.enableLog else { return self }
        
        APIManager.logDivider(start: true)
        APIManager.logPath(url: request.url, withKey: "REQUEST")
        APIManager.logHTTPMethod(request: request)
        APIManager.logHeaders(headers: request.allHTTPHeaderFields)
        if let method = request.httpMethod, method.uppercased() == "POST" {
            APIManager.logJson(data: request.httpBody)
        }
        APIManager.logDivider(start: false)
        
        return self
    }
    
}

extension APIManager {
    public static func logResponse(response: DataResponse<Data>) {
        guard let httpResponse = response.response, Constants.environment.enableLog else { return }
        
        self.logDivider(start: true)
        self.logPath(url: httpResponse.url, withKey: "RESPONSE")
        self.logStatus(httpResponse: httpResponse)
        self.logJson(data: response.data)
        self.logDivider(start: false)
    }
    
    public static func logDivider(start: Bool) {
        if start {
            print("|-------------------------------------------------")
        } else {
            print("-------------------------------------------------|")
        }
    }
    
    public static func logPath(url: URL?, withKey key: String) {
        guard let url = url else { return }
        print("\(key): \(url.absoluteString)")
    }
    
    public static func logStatus(httpResponse: HTTPURLResponse) {
        let status = HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode).capitalized
        print("STATUS: \(httpResponse.statusCode) - \(status)")
    }
    
    public static func logHeaders(headers: [String: String]?) {
        guard let headers = headers else { return }
        
        if headers.count > 0 {
            print("HEADERS: [")
            for (key, value) in headers {
                print("   \(key): \(value)")
            }
            print("]")
        }
    }
    
    public static func logJson(data: Data?) {
        guard let data = data else { return }
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let pretty = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                if let string = String(data: pretty, encoding: .utf8) {
                    print("JSON: \(string)")
                }
            } else {
                print("ERROR: Couldn't create json object from returned data")
                let string = String(data: data, encoding: .utf8) ?? ""
                print("DATA STRING: \(string)")
            }
        } catch {
            print("ERROR: \(error)")
        }
    }
    
    public static func logHTTPMethod(request: URLRequest) {
        guard let method = request.httpMethod else { return }
        print("METHOD: \(method)")
    }
}
