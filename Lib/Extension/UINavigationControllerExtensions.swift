//
//  UINavigationControllerExtensions.swift
//  CommonMyAIS
//
//  Created by Kent Winder on 12/06/2017.
//  Copyright © 2017 nextzy. All rights reserved.
//

import Foundation
import UIKit
extension UINavigationController {
    
    public func popViewController(animated: Bool, completion: @escaping () -> ()) {
        popViewController(animated: animated)
        
        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil, completion: { _ in
                completion()
            })
        } else {
            completion()
        }
    }
    
}
