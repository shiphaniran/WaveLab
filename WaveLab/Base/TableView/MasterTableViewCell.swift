//
//  MasterTableViewCell.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

import Foundation
import UIKit

class MasterTableViewCell: UITableViewCell {
    
    //MARK: INIT TABLE VIEW CELL
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.addView()
        self.controlSubView()
        self.setupConstraint()
    }
    
    //MARK: INIT CODER
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ADD COMPONENTS
    func addView() {
        
    }
    
    //MARK: CONTROL SUBVIEW OR LAYER OF COMPONENTS
    func controlSubView() {
        
    }
    
    //MARK: SETUP CONSTRAINT
    func setupConstraint() {
        
    }
}
