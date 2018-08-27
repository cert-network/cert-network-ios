//
//  String+Format.swift
//  CommonMyAIS
//
//  Created by Thongpak on 1/12/2560 BE.
//  Copyright © 2560 nextzy. All rights reserved.
//

import Foundation
import UIKit
public extension String {
    
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }
    
    public mutating func trim() {
        self = self.trimmed()
    }
    
    public func removeDash() -> String {
        return self.replacingOccurrences(of: "-", with: "")
    }
    
    public func trimmed() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public func trimBaht() -> String {
        return self.lowercased()
            .replacingOccurrences(of: "baht", with: "")
            .replacingOccurrences(of: "บาท", with: "")
            .trimmed()
    }
    
    // MARK: Obsolete functions
    @available(*, unavailable, message: "Renamed to currencyFormat")
    public func getCurrenctFormat() -> String  { return "" }
    
    @available(*, unavailable, message: "Renamed to toLocaleDateString")
    public func getDateFormate() -> String { return "" }
    
    
    /// Create `Data` from hexadecimal string representation
    ///
    /// This takes a hexadecimal representation and creates a `Data` object. Note, if the string has any spaces or non-hex characters (e.g. starts with '<' and with a '>'), those are ignored and only hex characters are processed.
    ///
    /// - returns: Data represented by this hexadecimal string.
    
    func toData() -> Data? {
        
        var data = Data(capacity: count / 2)
        
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSMakeRange(0, utf16.count)) { match, flags, stop in
            let byteString = (self as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        
        guard data.count > 0 else { return nil }
        
        return data
    }
}
