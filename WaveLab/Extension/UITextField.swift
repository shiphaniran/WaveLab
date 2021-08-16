//
//  UITextField.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

extension UITextField {
    //MARK: GET TEXT OF TEXTFIELD
    func getText() -> String {
        return self.text ?? ""
    }
    
    //MARK: SET UNDERLINE FOR TEXTFIELD
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = Theme.shared.underlineTextField.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    //MARK: CUSTOM PLACEHOLDER OF TEXTFIELD
    func setupPlaceholder(_ placholder: String) {
        self.attributedPlaceholder = NSAttributedString(
            string: placholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: Theme.shared.placeholder,
                NSAttributedString.Key.font: Font.shared.placeholder
            ])
    }
}
