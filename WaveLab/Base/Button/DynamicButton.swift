//
//  ActiveButton.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

enum ButtonStyle {
    case active
    case deactive
    case none
}

class DynamicButton: UIButton {
    
    /// Title of button
    let title: String
    
    /// Style of button
    var style: ButtonStyle
    
    //MARK: INIT CODER
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    //MARK: INIT FOR BUTTON
    init(_ title: String, style: ButtonStyle) {
        self.title = title
        self.style = style
        
        super.init(frame: .zero)
        self.initial()
    }
    
    //MARK: INITIAL
    private func initial() {
        self.isUserInteractionEnabled = true
        self.setTitle(self.title, for: .normal)
        self.titleLabel?.font = Font.shared.button
        self.layer.cornerRadius = Dimension.shared.corner
        
        switch style {
        case .active:
            self.isUserInteractionEnabled = true
            self.backgroundColor = Theme.shared.activeButton
            self.setTitleColor(Theme.shared.titleActiveButton, for: .normal)
        case .deactive:
            self.isUserInteractionEnabled = false
            self.backgroundColor = Theme.shared.deactiveButton
            self.setTitleColor(Theme.shared.titleDeactiveButton, for: .normal)
        default:
            self.isUserInteractionEnabled = true
            self.backgroundColor = Theme.shared.noneButton
            self.setTitleColor(Theme.shared.titleNoneButton, for: .normal)
        }
    }
    
    //MARK: CHANGE STYLE BUTTON
    func changeStyle(style: ButtonStyle) {
        self.style = style
        self.initial()
    }
    
    //MARK: ON TOUCH UP INSIDE EVENT
    func touchUpInside(_ target: Any, _ selector: Selector) {
        self.addTarget(target, action: selector, for: .touchUpInside)
    }
}
