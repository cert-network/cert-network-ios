//
//  UIViewExtension.swift
//  Template
//
//  Created by Thongpak on 17/10/2560 BE.
//  Copyright © 2560 nextzy. All rights reserved.
//

import UIKit

extension UIView {
    public func fadeAnimation(duration: TimeInterval = 0.3, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {

        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {

        }, completion: completion)
    }
    
    public func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        self.alpha = 0
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    public func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 3.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    func makeSubviewFit(view: UIView) {
        self.addConstraints(getConstraintsToFitSubview(view: view))
    }
    
    func getConstraintsToFitSubview(view: UIView) -> [NSLayoutConstraint] {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let leading  = getConstraint(view: view, relatedView: view.superview!, attribute: .leading)
        let trailing = getConstraint(view: view, relatedView: view.superview!, attribute: .trailing)
        let top      = getConstraint(view: view, relatedView: view.superview!, attribute: .top)
        let bottom   = getConstraint(view: view, relatedView: view.superview!, attribute: .bottom)
        
        return [leading, trailing, top, bottom]
    }
    
    func getConstraint(view: UIView, relatedView: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: attribute,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: relatedView,
                                  attribute: attribute,
                                  multiplier: 1,
                                  constant: 0)
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}
