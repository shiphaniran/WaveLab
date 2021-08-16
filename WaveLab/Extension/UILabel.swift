//
//  UILabel.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 16/08/2021.
//

import Foundation
import UIKit

extension UILabel {
    //MARK: GET TEXT OF LABEL
    func getText() -> String {
        return self.text ?? ""
    }
}
