//
//  UILabelExtensions.swift
//  CommonMyAIS
//
//  Created by Thongpak on 30/10/2560 BE.
//  Copyright © 2560 nextzy. All rights reserved.
//

import UIKit

public extension UILabel {
    public func underLine() {
        if let textUnwrapped = self.text {
            let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
            let underlineAttributedString = NSAttributedString(string: textUnwrapped, attributes: underlineAttribute)
            self.attributedText = underlineAttributedString
        }
    }
}
