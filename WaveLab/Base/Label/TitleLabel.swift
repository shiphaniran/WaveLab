//
//  TitleLabel.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

class TitleLabel: UILabel {
    
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
    
    //MARK: INITITAL
    private func initial() {
        self.text = title
        self.font = Font.shared.title
        self.textColor = Theme.shared.title
        self.numberOfLines = 0
    }
}
