//
//  PutInformationViewController.swift
//  wallet
//
//  Created by Thongpak on 18/6/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import IHKeyboardAvoiding
import AlertPickers

class PutInformationViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var inputContainerView: UIView!
    @IBOutlet weak var validateEmailLabel: UILabel!
    @IBOutlet weak var validatePhoneLabel: UILabel!
    
    var viewModel: RegisterViewModel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        viewModel.clearInitialKeychainData()

        setupTextFieldDelegate()
        setupErrorBinding()
        validateEmailLabel.isHidden = true
        validatePhoneLabel.isHidden = true
        KeyboardAvoiding.avoidingView = inputContainerView
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func setBackNavigationBarItem() {
        
    }
    
    func setupViewModel() {
        viewModel = RegisterViewModel()
    }
    
    func setupTextFieldDelegate() {
        emailTextField.delegate = self
        telTextField.delegate = self
        countryTextField.delegate = self
    }
    
    private func setupErrorBinding() {
        viewModel.errorRelay.asObservable().subscribe(onNext: { (error) in
            if let error = error {
                self.hideLoading()
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    private func requestOtp() {
        if let phoneNumber = viewModel.phoneNumber, let countryCode = viewModel.countryCode {
            let phoneNumberString = "\(countryCode)\(phoneNumber)"
            showLoading()
            viewModel.requestOtp(phoneNumber: phoneNumberString) {
                self.hideLoading()
                self.performSegue(withIdentifier: "informationToOTP", sender: self)
            }
        }
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        if validateFields() {
            let email = emailTextField.text?.trimmed()
            var phoneNumber = "\(countryTextField.text!)\(telTextField.text!)".trimmed().removeDash()
            phoneNumber = phoneNumber.replacingOccurrences(of: "-", with: "")
            self.viewModel.email = email
            self.viewModel.phoneNumber = self.telTextField.text?.trimmed().removeDash()
            self.viewModel.countryCode = self.countryTextField.text
            self.requestOtp()
        }
    }
    
    func validateFields() -> Bool {
        let email = emailTextField.text!.trimmed()
        let phoneNumber = "\(countryTextField.text!)\(telTextField.text!)".trimmed().removeDash()
        
        if !(email.isValidEmail()) {
            validateEmailLabel.text = "Email is invalid"
        }
        
        if !(phoneNumber.isValidPhoneNumber()) {
            validatePhoneLabel.text = "Phone number is invalid"
        }
        
        validateEmailLabel.isHidden = email.isValidEmail()
        validatePhoneLabel.isHidden = phoneNumber.isValidPhoneNumber()
        
        return validateEmailLabel.isHidden && validatePhoneLabel.isHidden
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        if let destination = segue.destination as? OTPViewController {
            viewModel.reset()
            destination.viewModel = viewModel
        }
    }

}

extension PutInformationViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == countryTextField {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addLocalePicker(type: .phoneCode) { info in
                self.countryTextField.text = info?.phoneCode
            }
            alert.addAction(title: "Cancel", style: .cancel)
            present(alert)
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            telTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
