//
//  BaseNavigationViewController.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit
import Material

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarFont()
        setNavigationBarProperties()
    }
    
    public func setNavBarFont() {
        self.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.font : RobotoFont.medium(with: 15),
            NSAttributedStringKey.foregroundColor : Color.deepPurple.darken1 as Any]
        self.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.font : RobotoFont.bold(with: 35),
            NSAttributedStringKey.foregroundColor : Color.deepPurple.darken1 as Any]
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedStringKey.font : RobotoFont.medium(with: 15),
            NSAttributedStringKey.foregroundColor: Color.deepPurple.darken1 as Any], for: .normal)
    }
    
    public func setNavigationBarProperties() {
        self.navigationBar.barStyle     = UIBarStyle.default
        //        self.navigationBar.barTintColor = UIColor(named: "Primary900")
        //        self.navigationBar.tintColor    = UIColor(named: "Primary900")
        self.navigationBar.isTranslucent  = false
    }
}
