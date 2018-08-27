//
//  SplashScreenViewController.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit
import RxSwift

class SplashScreenViewController: BaseViewController {
    let disposeBag = DisposeBag()
    var viewModel: SplashScreenViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        KeychainManager().deleteAllKey()
        setupViewModel()
    }
    
    func setupViewModel() {
        viewModel = SplashScreenViewModel()
//        showLoading()
//        viewModel.getCryptoList().subscribe(onNext: { (_) in
//            self.hideLoading()
//        }, onError: { (error) in
//            self.hideLoading()
//        }).disposed(by: disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if let _ = KeychainManager().string(forKey: KeychainManager.encryptionKey) {
            showMain()
        } else {
            createProfile()
        }
    }
    
    func createProfile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let vc = storyboard.instantiateInitialViewController()!
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.present(vc)
        }
    }
    
    func showMain() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let storyboard = UIStoryboard(name: "Approve", bundle: nil)
            let vc = storyboard.instantiateInitialViewController()!
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            let nav = BaseNavigationViewController(rootViewController: vc)
            self.present(nav)
        }
    }
}

//extension SplashScreenViewController: LoginViewControllerDelegate {
//    func didFinishedAuthentication() {
//        self.showLoading()
//        viewModel.shouldShowAuthen = false
//        viewModel.login().subscribe(onError: { (error) in
//            
//        }, onCompleted: {
//            self.getUserData()
//        }).disposed(by: disposeBag)
//    }
//    
//    func getUserData() {
//        CurrencyManager.instance.loadData()
//        self.viewModel.getInitialUserData().subscribe(onError: { (error) in
//            
//        }, onCompleted: {
//            self.viewModel.shouldShowAuthen = true
//            self.hideLoading()
//            self.showMain()
//        }).disposed(by: self.disposeBag)
//    }
//}
