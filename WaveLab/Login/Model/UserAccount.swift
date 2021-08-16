//
//  UserAccount.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 16/08/2021.
//

import Foundation
import UIKit

class UserAccount {
    
    /// User email
    var email: String
    
    /// User password
    var password: String
    
    //MARK: SET DATA FOR USER ACCOUNT
    init(json: [String: Any]) {
        self.email = json["email"] as? String ?? ""
        self.password = json["password"] as? String ?? ""
    }
}
