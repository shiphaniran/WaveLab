//
//  Layout.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

class Dimension {
    static let shared = Dimension()
    
    //MARK: GENERAL
    /// Value:  30.0
    var left: CGFloat = 30.0
    
    /// Value:  30.0
    var right: CGFloat = 30.0
    
    /// Value:  30.0
    var top: CGFloat = 30.0
    
    /// Value:  30.0
    var bottom: CGFloat = 30.0
    
    /// Value: 5.0
    var tinySpacing: CGFloat = 5.0
    
    /// Value: 10.0
    var smallSpacing: CGFloat = 10.0
    
    /// Value: 15.0
    var mediumSpacing: CGFloat = 15.0
    
    /// Value: 20.0
    var highSpacing: CGFloat = 20.0
    
    /// Value: 30.0
    var extremeSpacing: CGFloat = 30.0
    
    /// Value: 20.0
    var corner: CGFloat = 20.0
    
    /// Value: 10.0
    var cornerImage: CGFloat = 10.0
    
    /// Multiplier: 120%
    var multiAspectImageInCell: CGFloat = 1.20
    
    /// Multiplier: 70%
    var multiInputContainer: CGFloat = 0.70
    
    //MARK: TEXTFIELD
    /// Value: 40.0
    var textFieldHeight: CGFloat = 40.0
    
    /// Value: 30.0
    var paddingIconInTextField: CGFloat = 30.0
    
    //MARK: BUTTON
    
    /// Value: 40.0
    var buttonHeight: CGFloat = 40.0
    
    //MARK: LOGIN SCREEN
    /// Multiplier: 70%
    var login_multiAnim: CGFloat = 0.70
    
    //MARK: REGISTER SCREEN
    /// Multiplier: 45%
    var register_multiFName: CGFloat = 0.45
    
    /// Multiplier: 50%
    var register_multiLName: CGFloat = 0.50
    
    //MARK: HOME SCREEN
    /// Multiplier: 40%
    var home_multiImageCapture: CGFloat = 0.40
    
    /// Cell height: 100
    var home_userDataCellHeight: CGFloat = 100.0
}
