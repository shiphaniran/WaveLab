//
//  UIBarButton.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    //MARK: SET IMAGE FOR BAR ITEM
    func setImage(_ image: UIImage, target: Any, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(image: image, style: .plain, target: target, action: selector)
    }
    
    //MARK: SET TITLE FOR BAR ITEM
    func setTitle(_ title: String, target: Any, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
    }
}
