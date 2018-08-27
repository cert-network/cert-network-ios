//
//  APIManager.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 11/17/17.
//  Copyright © 2017 nextzy. All rights reserved.
//

import Alamofire
import Reachability

public class APIManager {
    public static let manager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.connectionProxyDictionary = APIProxy.configureProxy()
        
        return Alamofire.SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
    
    @discardableResult static func request<Result: Decodable>(withRouter router: BaseRouter, responseType: Result.Type, completion: @escaping (_ result: Result) -> (), failure: @escaping (_ error: BaseError) -> ()) -> Request? {
        //        if !NetworkManager.isReachable() {
        //            NotificationCenter.default.post(name: Constants.NotificationName.noInternetConnection, object: nil)
        //        }
        //
        return manager.request(router)
            .logRequest()
            .responseData(completionHandler: { (response) in
                self.logResponse(response: response)
                switch response.result {
                case .success(let data):
                    do {
                        let resultObj = try JSONDecoder().decode(responseType, from: data)
                        if let statusCode = response.response?.statusCode, statusCode == 200 {
                            completion(resultObj)
                        } else {
                            if let object = resultObj as? BaseResponse, let errorMessage = object.error {
                                if object.statusCode == 401 {
                                    completion(resultObj)
                                } else {
                                    let error = BaseError(message: errorMessage)
                                    failure(error)
                                }
                            }
                        }
                    } catch {
                        failure(BaseError(message: "Fail"))
                    }
                    break
                case .failure(let error):
                    let error = BaseError(message: error.localizedDescription)
                    failure(error)
                    break
                }
            })
    }
    
    @discardableResult static func download<Result: Decodable>(withRouter router: BaseRouter, responseType: Result.Type, completion: @escaping (_ result: BaseResponse) -> (), failure: @escaping (_ error: BaseError) -> ()) -> Request? {
        //        if !NetworkManager.isReachable() {
        //            NotificationCenter.default.post(name: Constants.NotificationName.noInternetConnection, object: nil)
        //        }
        let destination = Alamofire.DownloadRequest.suggestedDownloadDestination(for: .documentDirectory, in: .allDomainsMask)
        return manager.download(router, to: destination)
            .downloadProgress(closure: { (progress) in
            })
            .responseData(completionHandler: { (response) in
                switch response.result {
                case .success:
                    completion(BaseResponse())
                case .failure(let error):
                    let error = BaseError(message: error.localizedDescription)
                    failure(error)
                    break
                }
            })
    }
    
    static func validate(statusCode code: Int) -> Bool {
        if code != 200 {
            return false
        }
        
        return true
    }
}
