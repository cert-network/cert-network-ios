//
//  Environments.swift
//  wallet
//
//  Created by Thongpak on 12/6/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation

protocol Environment: class {
    var apiEndPoint: String { get set }
    var enableLog: Bool { get set }
}

class Develop: Environment {
    var apiEndPoint: String = "https://cert-network.herokuapp.com"
    var enableLog: Bool = true
}

class Production: Environment {
    var apiEndPoint: String = ""
    var enableLog: Bool = false
}

class Heroku: Environment {
    var apiEndPoint: String = "https://cert-network.herokuapp.com"
    var enableLog: Bool = true
}
