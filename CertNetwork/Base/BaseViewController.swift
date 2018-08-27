//
//  BaseViewController.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import MBProgressHUD

open class BaseViewController: UIViewController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
        setBackNavigationBarItem()
    }
    
    func setNavigationWhite() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    deinit {
        removeObserver()
    }
    
    open func showLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if let navigationController = self.navigationController {
            let loadingNotification = MBProgressHUD.showAdded(to: navigationController.view, animated: true)
            loadingNotification.mode = .indeterminate
        } else {
            let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
            loadingNotification.mode = .indeterminate
        }
    }
    
    open func hideLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        if let navigationController = self.navigationController {
            MBProgressHUD.hide(for: navigationController.view, animated: true)
        } else {
            MBProgressHUD.hide(for: view, animated: true)
        }
    }
    
    open func setBackNavigationBarItem() {
        if self.navigationController?.viewControllers.count ?? 0 > 0 {
            let backButtonImage = #imageLiteral(resourceName: "Back")
            
            // BarButtonItems
            let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            backButton.setImage(backButtonImage, for: .normal)
            backButton.tintColor = UIColor.black
            backButton.addTarget(self, action: #selector(self.backButtonAction), for: .touchUpInside)
            
            let backButtonItem = UIBarButtonItem(customView: backButton)
            self.navigationItem.leftBarButtonItem = backButtonItem
        }
    }
    
    open func setBackWhiteNavigationBarItem() {
        if self.navigationController?.viewControllers.count ?? 0 > 0 {
            let backButtonImage = #imageLiteral(resourceName: "arrow_back_24px")
            
            // BarButtonItems
            let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            backButton.setImage(backButtonImage, for: .normal)
            backButton.tintColor = UIColor.white
            backButton.addTarget(self, action: #selector(self.backButtonAction), for: .touchUpInside)
            
            let backButtonItem = UIBarButtonItem(customView: backButton)
            self.navigationItem.leftBarButtonItem = backButtonItem
        }
    }
    
    open func forceBackNavigationBarItem() {
        let backButtonImage = #imageLiteral(resourceName: "Back")
        
        // BarButtonItems
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        backButton.setImage(backButtonImage, for: .normal)
        backButton.tintColor = UIColor.black
        backButton.addTarget(self, action: #selector(self.backButtonAction), for: .touchUpInside)
        
        let backButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backButtonItem
    }
    
    @objc open func backButtonAction() {
        if let navBar = self.navigationController, navBar.viewControllers.first != self {
            navBar.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    func addObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveLanguageChangeNotification), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
    }
    
    @objc func didReceiveLanguageChangeNotification() {
        
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showAlert(title: String, message: String, with handler: @escaping (()->()) ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction((UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            handler()
        })))
        self.present(alert, animated: true)
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
