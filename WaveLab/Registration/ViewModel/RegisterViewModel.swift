//
//  RegisterViewModel.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 16/08/2021.
//

import Foundation
import UIKit

class RegisterViewModel: NSObject {
    //MARK: INIT VIEWMODEL
    override init() {
        super.init()
    }
    
    //MARK: REGISTER NEW ACCOUNT
    func registerNewAccount(email: String,
                            fName: String,
                            lName: String,
                            pwd: String,
                            member: String,
                            address: String,
                            mobile: String,
                            handler: @escaping (Response) -> ()) {
        let emailEncode = email.encode()
        let fNameEncode = fName.encode()
        let lNameEncode = lName.encode()
        let pwdEncode = pwd.encode()
        let memberEncode = member.encode()
        let addressEncode = address.encode()
        let mobileEncode = mobile.encode()
        
        if Manager.shared.database
            .saveUser(emailEncode,
                      fname: fNameEncode,
                      lname: lNameEncode,
                      password: pwdEncode,
                      membership: memberEncode,
                      address: addressEncode,
                      mobile: mobileEncode) {
            handler(.success)
        } else {
            handler(.failed)
        }
    }
}
