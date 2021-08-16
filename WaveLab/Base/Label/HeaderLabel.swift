//
//  HeaderLabel.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

class HeaderLabel: UILabel {
    
    /// Title of label
    let title: String
    
    //MARK: INIT CODER
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    //MARK: INIT LABEL
    init(_ title: String) {
        self.title = title
        
        super.init(frame: .zero)
        self.initial()
    }
    
    //MARK: INITIAL
    private func initial() {
        self.text = title
        self.font = Font.shared.header
        self.textColor = Theme.shared.header
        self.numberOfLines = 0
    }
}
