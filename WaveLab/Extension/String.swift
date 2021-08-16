//
//  String.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation

extension String {
    //MARK: CHECK STRING IS ""
    func isEmpty() -> Bool {
        if self.count > 0 {
            return true
        }
        return false
    }
    
    //MARK: COMPARE STRING IS EMAIL
    func isEmail() -> Bool {
        let checkKit = Trial.email.trial()
        return checkKit(self)
    }
    
    //MARK: ENCODE FOR STRING
    func encode() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
    
    //MARK: DECODE FOR STRING
    func decode() -> String {
        return self.removingPercentEncoding ?? ""
    }
    
    //MARK: COMPARE STRING IS PASSWORD
    func isPassword() -> Bool {
        let checkMin = Trial.length(.minimum, 6).trial()
        let checkMax = Trial.length(.maximum, 10).trial()
        
        if !checkMin(self) || !checkMax(self) {
            return false
        }
        
        return true
    }
    
    //MARK: COMPARE STRING IS PHONE
    func isPhone() -> Bool {
        let checkChar1 = Trial.format("^[0-9+]{0,1}+[0-9]{5,16}$").trial()
        
        if checkChar1(self) {
            return true
        } else {
            return false
        }
    }
}
