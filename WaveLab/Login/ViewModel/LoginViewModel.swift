//
//  LoginModel.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

import Foundation
import UIKit

class LoginViewModel: NSObject {
    //MARK: INIT VIEWMODEL
    override init() {
        super.init()
    }
    
    //MARK: LOGIN EMAIL & PWD
    func login(email: String, pwd: String) -> Bool {
        let emailEncode = email.encode()
        let pwdEncode = pwd.encode()
        
        var listUserResult = [UserAccount]()
        
        for i in Manager.shared.database.getAllUser() {
            let data = i as? [String: Any]
            if let dataOK = data {
                let user = UserAccount(json: dataOK)
                listUserResult.append(user)
            }
        }
        
        for user in listUserResult {
            if emailEncode == user.email && pwdEncode == user.password {
                return true
            }
        }
        return false
    }
}
