//
//  Font.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

class Font {
    static let shared = Font()
    
    /// Placeholder text
    var placeholder: UIFont = UIFont.systemFont(ofSize: 14.0, weight: .regular)
    
    /// Content text
    var content: UIFont = UIFont.systemFont(ofSize: 14.0, weight: .regular)
    
    /// Sub content text
    var subContent: UIFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
    
    /// Title text
    var title: UIFont = UIFont.systemFont(ofSize: 13.0, weight: .medium)
    
    /// Header text
    var header: UIFont = UIFont.systemFont(ofSize: 24.0, weight: .semibold)
    
    /// Special text
    var special: UIFont = UIFont.systemFont(ofSize: 15.0, weight: .medium)
    
    /// Button text
    var button: UIFont = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
}
