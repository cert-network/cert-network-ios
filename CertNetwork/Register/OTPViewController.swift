//
//  OTPViewController.swift
//  wallet
//
//  Created by Thongpak on 18/6/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import IHKeyboardAvoiding

class OTPViewController: BaseViewController {
    
    @IBOutlet weak var inputContainerView: UIView!
    @IBOutlet weak var countryLabel: BaseLabel!
    @IBOutlet weak var telLabel: BaseLabel!
    @IBOutlet weak var emailLabel: BaseLabel!
    @IBOutlet weak var otp1Textfield: UITextField!
    @IBOutlet weak var resendButton: BaseButton!
    @IBOutlet weak var validateConfirmCodeLabel: BaseLabel!
    
    var viewModel: RegisterViewModel!
    var time = 60
    var timer: Timer!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupTextFieldAppearance()
        setupTimer()
        setupErrorBinding()
        
        KeyboardAvoiding.avoidingView = inputContainerView
        
        title = "Confirm Code"
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        otp1Textfield.becomeFirstResponder()
    }
    
    private func setupTimer() {
        time = 60
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
    
    @objc func runTimedCode() {
        time -= 1
        UIView.performWithoutAnimation {
            if time <= 0 {
                resendButton.isEnabled = true
                resendButton.setTitle("Resend", for: .normal)
                timer.invalidate()
            } else {
                resendButton.isEnabled = false
                resendButton.setTitle("\(time) seconds", for: .normal)
            }
            resendButton.layoutIfNeeded()
        }
    }
    
    private func setupTextFieldAppearance() {
        otp1Textfield.layer.cornerRadius = 5
    }
    
    private func setupErrorBinding() {
        viewModel.errorRelay.asObservable().subscribe(onNext: { (error) in
            if error != nil {
                self.hideLoading()
                self.showInvalidCodeAlert()
            }
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    private func setupViewModel() {
        emailLabel.text = viewModel.email
        telLabel.text = viewModel.phoneNumber
        countryLabel.text = viewModel.countryCode
    }
    
    private func requestOtp() {
        if let countryCode = viewModel.countryCode, let phoneNumber = viewModel.phoneNumber {
            let phoneNumberString = "\(countryCode)\(phoneNumber)"
            viewModel.requestOtp(phoneNumber: phoneNumberString, completion: {})
        }
    }

    @IBAction func didTapNextButton(_ sender: Any) {
        let code = otp1Textfield.text!
        if validateOtpFormat(code: code) {
            showLoading()
            viewModel.validateOtp(code: code) {
                KeychainManager().save(string: "success", toKey: KeychainManager.encryptionKey)
                self.hideLoading()
                self.dismiss(completion: {
                    
                })
            }
        } else {
            showInvalidCodeAlert()
        }
    }
    
    private func validateOtpFormat(code: String) -> Bool {
        return code.count == 6
    }
    
    @IBAction func didTapResendButton(_ sender: Any) {
        requestOtp()
        setupTimer()
    }
    
    func showInvalidCodeAlert() {
        validateConfirmCodeLabel.isHidden = false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
//        if let destination = segue.destination as? PasscodeViewController {
//            viewModel.reset()
//            destination.viewModel = viewModel
//        }
    }
}
