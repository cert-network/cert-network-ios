//
//  BaseButton.swift
//  
//
//  Created by Thongpak on 12/6/2561 BE.
//

import UIKit

class BaseButton: UIButton {
    @IBInspectable var fontStyle: String?
    deinit {
        self.removeObserver()
    }
    
    override public func awakeFromNib() {
        self.localizeButton()
        self.setInterface()
        self.addObserver()
        setButtonBorder()
    }

    func addObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(BaseButton.localizeButton), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func localizeButton() {
//        if let key = self.key {
//            self.setTitle(key, for: .normal)
//            self.fadeAnimation()
//        }
    }
    
    func setInterface() {
        self.setFontSize()
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
            if fontStyle.lowercased() == "passcode" {
                return .passCode
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
            self.titleLabel?.font = BaseFontSize.ExtraSmall.getFont()
            break
        case .Small:
            self.titleLabel?.font = BaseFontSize.Small.getFont()
            break
        case .Medium:
            self.titleLabel?.font = BaseFontSize.Medium.getFont()
            break
        case .Large:
            self.titleLabel?.font = BaseFontSize.Large.getFont()
            break
        case .ExtraLarge:
            self.titleLabel?.font = BaseFontSize.ExtraLarge.getFont()
            break
        case .LargeBold:
            self.titleLabel?.font = BaseFontSize.LargeBold.getFont()
            break
        case .passCode:
            self.titleLabel?.font = BaseFontSize.passCode.getFont()
        }
    }
    
    func setButtonBorder() {
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
}
