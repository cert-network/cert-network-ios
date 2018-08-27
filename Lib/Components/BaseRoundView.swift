//
//  BaseRoundView.swift
//  wallet
//
//  Created by Thongpak on 19/6/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit

//class BaseRoundView: UIView {
//    
//    @IBInspectable var borderWidth: String?
//    @IBInspectable var borderColor: UIColor?
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setInterface()
//    }
//    
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setInterface()
//    }
//    
//    override public func awakeFromNib() {
//        super.awakeFromNib()
//        self.setInterface()
//        self.layoutIfNeeded()
//    }
//    
//    public override func prepareForInterfaceBuilder() {
//        self.setInterface()
//    }
//    
//    // Interface
//    
//    func setInterface() {
//        if let borderWidth = self.borderWidth, let width = Int(borderWidth) {
//            self.layer.borderWidth = CGFloat(width)
//        }
//        if let borderColor = self.borderColor {
//            self.layer.borderColor = borderColor.cgColor
//        }
//        self.layer.cornerRadius = 5
//        self.clipsToBounds = true
//    }
//}
