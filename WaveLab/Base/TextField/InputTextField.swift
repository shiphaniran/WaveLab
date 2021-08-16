//
//  InputTextField.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

enum TextFieldType {
    case email
    case password
    case none
}

class InputTextField: UITextField {
    
    /// Type of textfield
    let type: TextFieldType
    
    /// Textfield placeholder
    let hint: String
    
    //MARK: INIT CODER
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    //MARK: INIT TEXTFIELD
    init(type: TextFieldType, placeholder: String) {
        self.type = type
        self.hint = placeholder
        
        super.init(frame: .zero)
        
        self.initial()
    }
    
    //MARK: INITITAL
    private func initial() {
        self.autocorrectionType = .no
        self.backgroundColor = .clear
        self.autocapitalizationType = .none
        self.font = Font.shared.content
        
        let icon = UIImageView()
        icon.tintColor = Theme.shared.placeholder
        
        self.setupPlaceholder(hint)
        
        switch type {
        case .email:
            icon.image = UIImage(systemName: "envelope.fill")
            self.leftViewMode = .always
            self.keyboardType = .emailAddress
        case .password:
            icon.image = UIImage(systemName: "ellipsis.rectangle.fill")
            self.leftViewMode = .always
            self.isSecureTextEntry = true
            self.keyboardType = .default
        default:
            icon.image = nil
            self.leftViewMode = .never
            self.keyboardType = .default
        }
        
        self.leftView = icon
    }
    
    //MARK: ON CHANGE CHARACTER
    func editingChange(_ target: Any, _ selector: Selector) {
        self.addTarget(target, action: selector, for: .editingChanged)
    }
    
    //MARK: IN BEGIN EDITING
    func editingBegin(_ target: Any, _ selector: Selector) {
        self.addTarget(target, action: selector, for: .editingDidBegin)
    }
    
    //MARK: EDGEINSETS WHEN NORMAL STATE
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 5,
                                             left: (type == .none) ? 0 : Dimension.shared.paddingIconInTextField,
                                             bottom: 5,
                                             right: (type == .none) ? 0  : 10))
    }
    
    //MARK: EDGEINSETS WHEN EDITING STATE
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 5,
                                             left: (type == .none) ? 0 : Dimension.shared.paddingIconInTextField,
                                             bottom: 5,
                                             right: (type == .none) ? 0 : 10))
    }
}
