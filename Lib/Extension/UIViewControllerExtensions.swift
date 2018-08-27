//
//  UIViewControllerExtensions.swift
//  CommonMyAIS
//
//  Created by Thongpak on 20/11/2560 BE.
//  Copyright © 2560 nextzy. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    open func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    open func dismiss(completion: (() -> Swift.Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    public func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    open func present(storyboardName name: String, inBundle bundle: Bundle) {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        if let viewController = storyboard.instantiateInitialViewController() {
            present(viewController, animated: true, completion: nil)
        }
    }
    
    open func present(_ viewControllerToPresent: UIViewController) {
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    open func pushViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

