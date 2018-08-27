//
//  UIButtonExtensions.swift
//  CommonMyAIS
//
//  Created by Thongpak on 30/10/2560 BE.
//  Copyright © 2560 nextzy. All rights reserved.
//

import UIKit

public extension UIButton {
    public func underLine() {
        if let textUnwrapped = self.titleLabel?.text {
            let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
            let underlineAttributedString = NSAttributedString(string: textUnwrapped, attributes: underlineAttribute)
            self.titleLabel?.attributedText = underlineAttributedString
        }
    }
    
    public func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }
}
