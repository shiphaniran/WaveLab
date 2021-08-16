//
//  RegisterViewController.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

class RegisterViewController: MasterViewController {
    
    //MARK: CONSTANTS
    private enum Constants {
        static let textHeader = "TELL ME ABOUT YOU"
        static let swipeDownToDismiss = "Swipe down to dismiss"
        
        static let textFullName = "Full name"
        static let textEmail = "Email address"
        static let textPwd = "Your account password"
        static let textMembership = "Your membership"
        static let textAddress = "Your address"
        static let textMobile = "Your mobile number"
        static let textRegister = "REGISTER"
        
        static let placeholderGivenName = "Given name"
        static let placeholderFamilyName = "Family name"
        static let placeholderEmail = "example@email.com"
        static let placeholderPwd = "abc123@#$%"
        static let placeholderMembership = "Gold, Silver, Copper, ..."
        static let placeholderAddress = "123 Street No, Ward?, District?"
        static let placeholderPhone = "0123456789"
    }
    
    //MARK: VIEWMODEL
    var viewModel = RegisterViewModel()
    
    //MARK: COMPONENTS
    var lbTitle: HeaderLabel = {
        let lb = HeaderLabel(Constants.textHeader)
        lb.alpha = 0
        return lb
    }()
    
    var lbDismiss: SubContentLabel = {
        let lb = SubContentLabel(Constants.swipeDownToDismiss)
        return lb
    }()
    
    var viewBoundInput: UIView = {
        let view = UIView()
        view.alpha = 0
        return view
    }()
    
    var lbYourName: TitleLabel = {
        let lb = TitleLabel(Constants.textFullName)
        return lb
    }()
    
    var inputFName: InputTextField = {
        let input = InputTextField(
            type: .none,
            placeholder: Constants.placeholderGivenName)
        return input
    }()
    
    var inputLName: InputTextField = {
        let input = InputTextField(
            type: .none,
            placeholder: Constants.placeholderFamilyName)
        return input
    }()
    
    var lbYourEmail: TitleLabel = {
        let lb = TitleLabel(Constants.textEmail)
        return lb
    }()
    
    var inputEmail: InputTextField = {
        let input = InputTextField(
            type: .none,
            placeholder: Constants.placeholderEmail)
        return input
    }()
    
    var lbYourPwd: TitleLabel = {
        let lb = TitleLabel(Constants.textPwd)
        return lb
    }()
    
    var inputPwd: InputTextField = {
        let input = InputTextField(
            type: .none,
            placeholder: Constants.placeholderPwd)
        return input
    }()
    
    var lbYourMember: TitleLabel = {
        let lb = TitleLabel(Constants.textMembership)
        return lb
    }()
    
    var inputMembership: InputTextField = {
        let input = InputTextField(
            type: .none,
            placeholder: Constants.placeholderMembership)
        return input
    }()
    
    var lbYourAddress: TitleLabel = {
        let lb = TitleLabel(Constants.textAddress)
        return lb
    }()
    
    var inputAddress: InputTextField = {
        let input = InputTextField(
            type: .none,
            placeholder: Constants.placeholderAddress)
        return input
    }()
    
    var lbYourMobile: TitleLabel = {
        let lb = TitleLabel(Constants.textMobile)
        return lb
    }()
    
    var inputMobile: InputTextField = {
        let input = InputTextField(
            type: .none,
            placeholder: Constants.placeholderPhone)
        return input
    }()
    
    var btnRegister: DynamicButton = {
        let btn = DynamicButton(Constants.textRegister, style: .deactive)
        btn.alpha = 0
        return btn
    }()
    
    //MARK: ADD COMPONENTS
    override func addView() {
        self.view.addSubview(self.lbDismiss)
        self.view.addSubview(self.viewBoundInput)
        
        self.viewBoundInput.addSubview(self.lbYourName)
        self.viewBoundInput.addSubview(self.inputFName)
        self.viewBoundInput.addSubview(self.inputLName)
        
        self.viewBoundInput.addSubview(self.lbYourEmail)
        self.viewBoundInput.addSubview(self.inputEmail)
        
        self.viewBoundInput.addSubview(self.lbYourPwd)
        self.viewBoundInput.addSubview(self.inputPwd)
        
        self.viewBoundInput.addSubview(self.lbYourMember)
        self.viewBoundInput.addSubview(self.inputMembership)
        
        self.viewBoundInput.addSubview(self.lbYourAddress)
        self.viewBoundInput.addSubview(self.inputAddress)
        
        self.viewBoundInput.addSubview(self.lbYourMobile)
        self.viewBoundInput.addSubview(self.inputMobile)
        
        self.view.addSubview(self.btnRegister)
        self.view.addSubview(self.lbTitle)
    }
    
    //MARK: ADD SUBVIEW OR LAYER OF COMPONENTS
    override func controlSubView() {
        self.inputFName.setUnderLine()
        self.inputLName.setUnderLine()
        self.inputEmail.setUnderLine()
        self.inputPwd.setUnderLine()
        self.inputMembership.setUnderLine()
        self.inputAddress.setUnderLine()
        self.inputMobile.setUnderLine()
    }
    
    //MARK: ACTION FOR COMPONENTS
    override func setupAction() {
        Animation.shared.alterFade(object: self.lbDismiss)
        Animation.shared.fadeIn(objects: [self.lbTitle, self.viewBoundInput, self.btnRegister])
        
        self.btnRegister.touchUpInside(self, #selector(self.checkRegisterInfo))
        
        //On change character
        self.inputFName.editingChange(self, #selector(self.onChangeCharacter))
        self.inputLName.editingChange(self, #selector(self.onChangeCharacter))
        self.inputEmail.editingChange(self, #selector(self.onChangeCharacter))
        self.inputPwd.editingChange(self, #selector(self.onChangeCharacter))
        self.inputMembership.editingChange(self, #selector(self.onChangeCharacter))
        self.inputAddress.editingChange(self, #selector(self.onChangeCharacter))
        self.inputMobile.editingChange(self, #selector(self.onChangeCharacter))
    }
    
    //MARK: DETECT WHEN KEYBOARD SHOWN
    override func keyboardWillAppear() {
        let moveY = self.lbTitle.frame.height + Dimension.shared.extremeSpacing
        
        Animation.shared.fadeOut(objects: [self.lbTitle])
        Animation.shared.translateY(objects: [self.viewBoundInput], y: -moveY)
    }
    
    //MARK: DETECT WHEN KEYBOARD HIDE
    override func keyboardWillDisappear() {
        Animation.shared.identity(objects: [self.viewBoundInput, self.lbTitle])
    }
    
    //MARK: SETUP CONSTRAINTS FOR COMPONENTS
    override func setupConstraint() {
        self.lbDismiss.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Dimension.shared.extremeSpacing)
            make.centerX.equalToSuperview()
        }
        
        self.viewBoundInput.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-Dimension.shared.extremeSpacing - Dimension.shared.top * 2)
            make.width.equalToSuperview().multipliedBy(Dimension.shared.multiInputContainer)
        }
        
        //PART NAME
        self.lbYourName.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        self.inputFName.snp.makeConstraints { make in
            make.top.equalTo(self.lbYourName.snp.bottom)
            make.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Dimension.shared.register_multiFName)
            make.height.equalTo(Dimension.shared.textFieldHeight)
        }
        
        self.inputLName.snp.makeConstraints { make in
            make.top.equalTo(self.lbYourName.snp.bottom)
            make.right.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Dimension.shared.register_multiLName)
            make.height.equalTo(Dimension.shared.textFieldHeight)
        }
        
        //PART EMAIL
        self.lbYourEmail.snp.makeConstraints { make in
            make.top.equalTo(self.inputFName.snp.bottom).offset(Dimension.shared.mediumSpacing)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        self.inputEmail.snp.makeConstraints { make in
            make.top.equalTo(self.lbYourEmail.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Dimension.shared.textFieldHeight)
        }
        
        //PART PASSWORD
        self.lbYourPwd.snp.makeConstraints { make in
            make.top.equalTo(self.inputEmail.snp.bottom).offset(Dimension.shared.mediumSpacing)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        self.inputPwd.snp.makeConstraints { make in
            make.top.equalTo(self.lbYourPwd.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Dimension.shared.textFieldHeight)
        }
        
        //PART MEMBERSHIP
        self.lbYourMember.snp.makeConstraints { make in
            make.top.equalTo(self.inputPwd.snp.bottom).offset(Dimension.shared.mediumSpacing)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        self.inputMembership.snp.makeConstraints { make in
            make.top.equalTo(self.lbYourMember.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Dimension.shared.textFieldHeight)
        }
        
        //PART ADDRESS
        self.lbYourAddress.snp.makeConstraints { make in
            make.top.equalTo(self.inputMembership.snp.bottom).offset(Dimension.shared.mediumSpacing)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        self.inputAddress.snp.makeConstraints { make in
            make.top.equalTo(self.lbYourAddress.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Dimension.shared.textFieldHeight)
        }
        
        //PART MOBILE
        self.lbYourMobile.snp.makeConstraints { make in
            make.top.equalTo(self.inputAddress.snp.bottom).offset(Dimension.shared.mediumSpacing)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        self.inputMobile.snp.makeConstraints { make in
            make.top.equalTo(self.lbYourMobile.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Dimension.shared.textFieldHeight)
            make.bottom.equalToSuperview()
        }
        
        //PART BUTTON
        self.btnRegister.snp.makeConstraints { make in
            make.top.equalTo(self.viewBoundInput.snp.bottom).offset(Dimension.shared.extremeSpacing)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.viewBoundInput.snp.width)
            make.height.equalTo(Dimension.shared.buttonHeight)
        }
        
        //PART TITLE
        self.lbTitle.snp.makeConstraints { make in
            make.bottom.equalTo(self.viewBoundInput.snp.top).offset(-Dimension.shared.extremeSpacing)
            make.left.equalTo(self.viewBoundInput.snp.left)
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
    //MARK: CHANGE CHARACTERS IN ALL TEXTFIELD
    @objc
    fileprivate func onChangeCharacter() {
        if !self.inputEmail.getText().isEmpty &&
            !self.inputPwd.getText().isEmpty &&
            !self.inputFName.getText().isEmpty &&
            !self.inputLName.getText().isEmpty &&
            !self.inputMembership.getText().isEmpty &&
            !self.inputAddress.getText().isEmpty &&
            !self.inputMobile.getText().isEmpty {
            
            self.btnRegister.changeStyle(style: .active)
        } else {
            self.btnRegister.changeStyle(style: .deactive)
        }
    }
    
    //MARK: CHECK REGISTER INFO
    @objc
    fileprivate func checkRegisterInfo() {
        if !self.inputEmail.getText().isEmail() {
            BannerNotification.shared.show(title: Manager.shared.errorTitle,
                                           description: Manager.shared.errorEmailFormat,
                                           style: .danger)
        } else if !self.inputPwd.getText().isPassword() {
            BannerNotification.shared.show(title: Manager.shared.errorTitle,
                                           description: Manager.shared.errorPwdFormat,
                                           style: .danger)
        } else if !self.inputMobile.getText().isPhone() {
            BannerNotification.shared.show(title: Manager.shared.errorTitle,
                                           description: Manager.shared.errorMobileFormat,
                                           style: .danger)
        } else {
            BannerNotification.shared.show(title: Manager.shared.infoTitle,
                                           description: Manager.shared.successRegisterFormat,
                                           style: .info)
            
            //Delay 2 seconds for smooth UI/UX
            self.perform(#selector(self.createNewAccount), with: nil, afterDelay: 2)
        }
    }
    
    //MARK: CREATE NEW ACCOUNT
    @objc
    private func createNewAccount() {
        viewModel.registerNewAccount(
            email: self.inputEmail.getText(),
            fName: self.inputFName.getText(),
            lName: self.inputLName.getText(),
            pwd: self.inputPwd.getText(),
            member: self.inputMembership.getText(),
            address: self.inputAddress.getText(),
            mobile: self.inputMobile.getText(),
            handler: { response in
                switch response {
                case .success:
                    BannerNotification.shared
                        .show(title: Manager.shared.successTitle,
                              description: Manager.shared.successRegisterAccount,
                              style: .success)
                    
                    //Dismiss Register screen
                    self.dismiss(animated: true)
                case .failed:
                    BannerNotification.shared
                        .show(title: Manager.shared.errorTitle,
                              description: Manager.shared.errorRegisterAccount,
                              style: .danger)
                }
            })
    }
}
