//
//  CornerImageView.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 16/08/2021.
//

import Foundation
import UIKit

class CornerImageView: UIImageView {
    
    /// Corner radius of image view
    let corner: CGFloat
    
    /// image for image view
    let iv: UIImage
    
    //MARK: INIT CODER
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    //MARK: INIT IMAGEVIEW
    init(_ corner: CGFloat, image: UIImage) {
        self.corner = corner
        self.iv = image
        
        super.init(frame: .zero)
        self.initial()
    }
    
    //MARK: INITITAL
    private func initial() {
        self.backgroundColor = Theme.shared.placeholder
        self.image = self.iv
        
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = self.corner
    }
    
    //MARK: SET IMAGE FOR IMAGE VIEW
    func setImage(_ image: UIImage) {
        self.image = image
    }
}
