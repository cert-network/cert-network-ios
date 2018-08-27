//
//  DateExtensions.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 1/12/18.
//  Copyright © 2018 nextzy. All rights reserved.
//

import Foundation

extension Date {
    public func toString(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
//        formatter.locale = MyAISConverter().getLocale(formDate: formatter.string(from: self), format: format)
        return formatter.string(from: self)
    }
}
