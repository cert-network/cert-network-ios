//
//  APIProxy.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 12/06/2017.
//  Copyright © 2017 nextzy. All rights reserved.
//

import Foundation
import Reachability

public class APIProxy {
    public static let enabled = false
    public static let host = "110.49.174.143"
    public static let port = 3128
    public static let user = "myais"
    public static let pass = "myais"
    public static let httpOnly = 1
    
    public static func configureProxy() -> [AnyHashable: Any]? {
        guard enabled && NetworkManager.isCellular() else { return nil }
        
        let proxyInfo: [AnyHashable : Any] = [
            kCFNetworkProxiesHTTPProxy: host,
            kCFNetworkProxiesHTTPPort: port,
            kCFProxyUsernameKey: user,
            kCFProxyPasswordKey: pass,
            kCFNetworkProxiesHTTPEnable: httpOnly
        ]
        
        return proxyInfo
    }
    
}

public class NetworkManager {
    
    static func isReachable() -> Bool {
        if let reachability = Reachability() {
            if reachability.connection == .none {
                return false
            } else {
                return true
            }
        }
        
        return false
    }
    
    static func isCellular() -> Bool {
        if let reachability = Reachability() {
            return reachability.connection == .cellular
        }
        
        return false
    }
}
