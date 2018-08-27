//
//  ApproveConfirmViewController.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit
import UIGradient
import RxSwift

class ApproveConfirmViewController: BaseViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var certLabel: UILabel!
    @IBOutlet weak var feeTextField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    var viewModel: ApproveViewModel!
    var cert: CertDetail!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setupViewModel()
        setNavigationWhite()
        setBackWhiteNavigationBarItem()
    }
    
    override func setBackNavigationBarItem() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func setupViewModel() {
        viewModel = ApproveViewModel()
    }
    
    func setView() {
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        profileImageView.image = #imageLiteral(resourceName: "gim")
        profileImageView.layer.cornerRadius = profileImageView.layer.height / 2
        profileImageView.clipsToBounds = true
        let color1 = UIColor.hex("2196F3")
        let color2 = UIColor.hex("64E3B2")
        self.view.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: view.frame, colors: [color1, color2])
        submitButton.layer.cornerRadius = submitButton.layer.height / 2
        submitButton.clipsToBounds = true
        rejectButton.layer.cornerRadius = submitButton.layer.height / 2
        rejectButton.clipsToBounds = true
        submitButton.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: view.frame, colors: [color1, color2])
        rejectButton.addTarget(self, action: #selector(reject), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(approve), for: .touchUpInside)
        addressLabel.text = nil
        nameLabel.text = cert.certCreatorName
        certLabel.text = cert.certName
    }
    
    @objc func reject() {
        showLoading()
        viewModel.reject(address: HDWallet.shared.getAddress(), privateKey: "0x" + HDWallet.shared.getPrivateKey(), category: cert.category ?? "", name: "Thongpak Pongsilathong", certId: cert.certId ?? "").subscribe(onNext: { (message) in
            self.hideLoading()
            self.showAlert(title: "success", message: message, with: {
                self.dismiss()
            })
        }, onError: { (error) in
            self.hideLoading()
            self.showAlert(title: "Error", message: "")
        }).disposed(by: disposeBag)
    }
    
    @objc func approve() {
        showLoading()
        viewModel.approve(address: HDWallet.shared.getAddress(), privateKey: "0x" + HDWallet.shared.getPrivateKey(), category: cert.category ?? "", name: "Thongpak Pongsilathong", certId: cert.certId ?? "").subscribe(onNext: { (message) in
            self.hideLoading()
            self.showAlert(title: "success", message: message, with: {
                self.dismiss()
            })
        }, onError: { (error) in
            self.hideLoading()
            self.showAlert(title: "Error", message: "")
        }).disposed(by: disposeBag)
    }
    
}
