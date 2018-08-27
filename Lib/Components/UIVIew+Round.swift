//
//  CurrencyUnitConvert.swift
//  wallet
//
//  Created by Thongpak on 3/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit

public class TopRoundView: UIView {
    
    override public func draw(_ rect: CGRect) {
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii: CGSize(width: 8.0, height: 8.0))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }
    
}
