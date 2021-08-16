//
//  DefaultTableView.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

import Foundation
import UIKit

class DefaultTableView: UITableView {
    
    //MARK: INIT CODER
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    //MARK: INIT TABLEVIEW
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.separatorStyle = .none
    }
}
