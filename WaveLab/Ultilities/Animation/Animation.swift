//
//  Animation.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

class Animation {
    static let shared = Animation()
    
    //MARK: ALTERNATIVE FADE IN/OUT
    func alterFade(object: UIView) {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: .repeat, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3) {
                object.alpha = 0.10
            }
            
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) {
                object.alpha = 0.55
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) {
                object.alpha = 1.00
            }
        })
    }
    
    //MARK: FADE IN
    func fadeIn(objects: [UIView]) {
        for i in objects {
            UIView.animate(withDuration: 0.3) {
                i.alpha = 1.0
            }
        }
    }
    
    //MARK: FADE OUT
    func fadeOut(objects: [UIView]) {
        for i in objects {
            UIView.animate(withDuration: 0.3) {
                i.alpha = 0.0
            }
        }
    }
    
    //MARK: TRANSLATE Y
    func translateY(objects: [UIView], y: CGFloat) {
        for i in objects {
            UIView.animate(withDuration: 0.3) {
                i.layer.transform = CATransform3DMakeTranslation(0, y, 0)
            }
        }
    }
    
    //MARK: RESET
    func identity(objects: [UIView]) {
        for i in objects {
            UIView.animate(withDuration: 0.3) {
                i.layer.transform = CATransform3DIdentity
                i.alpha = 1.0
            }
        }
    }
}
