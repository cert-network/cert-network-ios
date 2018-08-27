//
//  UIFontExtension.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS)

import UIKit

/// EZSwiftExtensions
public enum FontType: String {
    case None = ""
    case Regular = "Regular"
    case Bold = "Bold"
    case DemiBold = "DemiBold"
    case Light = "Light"
    case UltraLight = "UltraLight"
    case Italic = "Italic"
    case Thin = "Thin"
    case Book = "Book"
    case Roman = "Roman"
    case Medium = "Medium"
    case MediumItalic = "MediumItalic"
    case CondensedMedium = "CondensedMedium"
    case CondensedExtraBold = "CondensedExtraBold"
    case SemiBold = "SemiBold"
    case BoldItalic = "BoldItalic"
    case Heavy = "Heavy"
    case HeventRegular = "Cond"
    case HeventMed = "MedCond"
}

/// EZSwiftExtensions
public enum FontName: String {
    case Tahoma = "Tahoma"
    case HelvethaicaAIS = "DBHelvethaicaAISX"
    case HelveticaNeue
    case Helvetica
    case Futura
    case Menlo
    case Avenir
    case AvenirNext
    case Didot
    case AmericanTypewriter
    case Baskerville
    case Geneva
    case GillSans
    case SanFranciscoDisplay
    case Seravek
    case HeaventRounded = "DBHeaventRounded"
}

extension UIFont {
    
    /// EZSwiftExtensions
    public class func Font(_ name: FontName, type: FontType, size: CGFloat) -> UIFont! {
        //Using type
        let fontName = name.rawValue + "-" + type.rawValue
        
        if let font = UIFont.init(name: fontName, size: size) {
            return font
        }
        
        //That font doens't have that type, try .None
        let fontNameNone = name.rawValue
        if let font = UIFont.init(name: fontNameNone, size: size) {
            return font
        }
        
        //That font doens't have that type, try .Regular
        let fontNameRegular = name.rawValue + "-" + "Regular"
        if let font = UIFont.init(name: fontNameRegular, size: size) {
            return font
        }
        
        return nil
    }
    
    /// EZSwiftExtensions
    public class func HelveticaNeue(type: FontType, size: CGFloat) -> UIFont {
        return Font(.HelveticaNeue, type: type, size: size)
    }
    
    /// EZSwiftExtensions
    public class func AvenirNext(type: FontType, size: CGFloat) -> UIFont {
        return Font(.AvenirNext, type: type, size: size)
    }
    
    /// EZSwiftExtensions
    public class func AvenirNextDemiBold(size: CGFloat) -> UIFont {
        return Font(.AvenirNext, type: .DemiBold, size: size)
    }
    
    /// EZSwiftExtensions
    public class func AvenirNextRegular(size: CGFloat) -> UIFont {
        return Font(.AvenirNext, type: .Regular, size: size)
    }
    
    // MARK: Deprecated
    /// EZSwiftExtensions
    @available(*, deprecated: 1.8)
    public class func PrintFontFamily(_ font: FontName) {
        let arr = UIFont.fontNames(forFamilyName: font.rawValue)
        for name in arr {
            print(name)
        }
    }
}

#endif
