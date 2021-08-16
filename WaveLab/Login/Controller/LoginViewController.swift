//
//  LoginViewController.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 13/08/2021.
//

import Foundation
import UIKit
import Lottie

class LoginViewController: MasterViewController {
    
    //MARK: CONSTANTS
    private enum Constants {
        static let textHeader = "HAVE A NICE DAY"
        static let placeholderEmail = "example@email.com"
        static let placeholderPwd = "your password"
        static let textLogin = "LOGIN"
        static let textDontHaveAccount = "Don't have account?"
        static let textRegister = "Register now"
    }
    
    //MARK: VIEWMODEL
    private var viewModel = LoginViewModel()
    
    //MARK: COMPONENTS
    var viewAnim: AnimationView = {
        let view = AnimationView(name: Manager.shared.login_anim)
        view.loopMode = .loop
        return view
    }()
    
    var lbHeader: HeaderLabel = {
        let lb = HeaderLabel(Constants.textHeader)
        return lb
    }()
    
    var viewBoundInput: UIView = {
        let view = UIView()
        return view
    }()
    
    var inputEmail: InputTextField = {
        let input = InputTextField(
            type: .email, placeholder: Constants.placeholderEmail)
        
        return input
    }()
    
    var inputPwd: InputTextField = {
        let input = InputTextField(
            type: .password,
            placeholder: Constants.placeholderPwd)
        return input
    }()
    
    var btnLogin: DynamicButton = {
        let button = DynamicButton(Constants.textLogin, style: .deactive)
        return button
    }()
    
    var viewBoundSignUp: UIView = {
        let view = UIView()
        return view
    }()
    
    var lbRegister: ContentLabel = {
        let lb = ContentLabel(Constants.textDontHaveAccount)
        return lb
    }()
    
    var tapRegister: ActionLabel = {
        let lb = ActionLabel(Constants.textRegister)
        return lb
    }()
    
    //MARK: ADD COMPONENTS
    override func addView() {
        self.view.addSubview(self.viewAnim)
        self.view.addSubview(self.viewBoundInput)
        
        self.viewBoundInput.addSubview(self.inputEmail)
        self.viewBoundInput.addSubview(self.inputPwd)
        
        self.view.addSubview(self.lbHeader)
        self.view.addSubview(self.btnLogin)
        
        self.view.addSubview(self.viewBoundSignUp)
        self.viewBoundSignUp.addSubview(self.lbRegister)
        self.viewBoundSignUp.addSubview(self.tapRegister)
    }
    
    //MARK: ADD SUBVIEW OR LAYER OF COMPONENTS
    override func controlSubView() {
        self.inputEmail.setUnderLine()
        self.inputPwd.setUnderLine()
        
        self.inputEmail.delegate = self
        self.inputPwd.delegate = self
    }
    
    //MARK: ACTION FOR COMPONENTS
    override func setupAction() {
        self.viewAnim.play()
        
        self.tapRegister.setAction(self, #selector(self.openRegistration))
        self.btnLogin.touchUpInside(self, #selector(self.checkLogin))
        self.inputEmail.editingChange(self, #selector(self.onChangeEmailAndPwd))
        self.inputPwd.editingChange(self, #selector(self.onChangeEmailAndPwd))
    }
    
    //MARK: SETUP CONSTRAINT FOR COMPONENTS
    override func setupConstraint() {
        self.viewAnim.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Dimension.shared.login_multiAnim)
            make.height.equalTo(self.viewAnim.snp.width)
        }
        
        self.viewBoundInput.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-Dimension.shared.extremeSpacing)
            make.width.equalToSuperview().multipliedBy(Dimension.shared.multiInputContainer)
        }
        
        self.inputEmail.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(Dimension.shared.textFieldHeight)
        }
        
        self.inputPwd.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(Dimension.shared.textFieldHeight)
            make.top.equalTo(self.inputEmail.snp.bottom).offset(Dimension.shared.smallSpacing)
        }
        
        self.lbHeader.snp.makeConstraints { make in
            make.left.equalTo(self.viewBoundInput.snp.left)
            make.bottom.equalTo(self.viewBoundInput.snp.top).offset(-Dimension.shared.mediumSpacing)
        }
        
        self.btnLogin.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.viewBoundInput.snp.bottom).offset(Dimension.shared.extremeSpacing)
            make.height.equalTo(Dimension.shared.buttonHeight)
            make.width.equalTo(self.viewBoundInput.snp.width)
        }
        
        self.viewBoundSignUp.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.btnLogin.snp.bottom).offset(Dimension.shared.extremeSpacing)
        }
        
        self.lbRegister.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        self.tapRegister.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalTo(self.lbRegister.snp.right).offset(Dimension.shared.tinySpacing)
        }
    }
}

extension LoginViewController {
    //MARK: OPEN REGISTER VIEW
    @objc
    fileprivate func openRegistration() {
        self.present(RegisterViewController(), animated: true, completion: nil)
    }
    
    //MARK: CHECK EMAIL AND PWD
    @objc
    fileprivate func checkLogin() {
        if !self.inputEmail.getText().isEmail() {
            BannerNotification.shared.show(title: Manager.shared.errorTitle,
                                           description: Manager.shared.errorEmailFormat,
                                           style: .danger)
        } else if !self.inputPwd.getText().isPassword() {
            BannerNotification.shared.show(title: Manager.shared.errorTitle,
                                           description: Manager.shared.errorPwdFormat,
                                           style: .danger)
        } else {
            BannerNotification.shared.show(title: Manager.shared.infoTitle,
                                           description: Manager.shared.successLoginFormat,
                                           style: .info)
            self.view.endEditing(true)
            
            //Delay 2 seconds for smooth UI/UX
            self.perform(#selector(self.loginUserAccount), with: nil, afterDelay: 2)
        }
    }
    
    //MARK: LOGIN USER ACCOUNT
    @objc
    private func loginUserAccount() {
        let email = inputEmail.getText()
        let pwd = inputPwd.getText()
        
        if viewModel.login(email: email, pwd: pwd) {
            self.successLoginFlow()
        } else {
            BannerNotification.shared.show(title: Manager.shared.errorTitle,
                                           description: Manager.shared.errorLoginAccount,
                                           style: .danger)
        }
    }
    
    //MARK: FLOW AFTER LOGIN SUCCESSFUL
    private func successLoginFlow() {
        UserDefaults.standard.setValue(true, forKey: Key.shared.USER_LOGIN)
        
        let homeVC = HomeViewController()
        let navi = UINavigationController(rootViewController: homeVC)
        navi.modalPresentationStyle = .fullScreen
        self.present(navi, animated: false)
    }
}

extension LoginViewController: UITextFieldDelegate {
    //MARK: CHANGE CHARACTERS IN EMAIL AND PWD
    @objc
    fileprivate func onChangeEmailAndPwd() {
        if !self.inputEmail.getText().isEmpty && !self.inputPwd.getText().isEmpty {
            self.btnLogin.changeStyle(style: .active)
        } else {
            self.btnLogin.changeStyle(style: .deactive)
        }
    }
}
