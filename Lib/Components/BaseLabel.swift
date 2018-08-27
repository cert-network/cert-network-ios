//
//  BaseLabel.swift
//  wallet
//
//  Created by Thongpak on 12/6/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit

class BaseLabel: UILabel {
    @IBInspectable var fontStyle: String?
    @IBInspectable var key: String?
    
    deinit {
        self.removeObserver()
    }
    
    override public func awakeFromNib() {
        self.localizeButton()
        self.setInterface()
        self.addObserver()
    }
    
    func addObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(BaseLabel.localizeButton), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setInterface() {
        setFontSize()
    }
    
    public var _fontSize: BaseFontSize {
        if let fontStyle = self.fontStyle {
            if fontStyle.lowercased().contains("extrasmall") {
                return .ExtraSmall
            }
            if fontStyle.lowercased().contains("small") {
                return .Small
            }
            if fontStyle.lowercased().contains("medium") {
                return .Medium
            }
            if fontStyle.lowercased().contains("extralarge") {
                return .ExtraLarge
            }
            if fontStyle.lowercased().contains("large") {
                return .Large
            }
        }
        return .Small
    }
    
    public func setFontSize() {
        switch _fontSize {
        case .ExtraSmall:
            self.font = BaseFontSize.ExtraSmall.getFont()
            break
        case .Small:
            self.font = BaseFontSize.Small.getFont()
            break
        case .Medium:
            self.font = BaseFontSize.Medium.getFont()
            break
        case .Large:
            self.font = BaseFontSize.Large.getFont()
            break
        case .ExtraLarge:
            self.font = BaseFontSize.ExtraLarge.getFont()
            break
        case .LargeBold:
            self.font = BaseFontSize.LargeBold.getFont()
            break
        case .passCode:
            self.font = BaseFontSize.passCode.getFont()
        }
    }
    
    @objc func localizeButton() {
//        if let key = self.key {
//            self.text = key.localized()
//            self.fadeAnimation()
//        }
    }

}
