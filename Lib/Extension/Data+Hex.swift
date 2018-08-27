//
//  Data+Hex.swift
//  wallet
//
//  Created by Thongpak on 4/7/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
extension Data {
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }
    
    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return map { String(format: format, $0) }.joined()
    }
}
