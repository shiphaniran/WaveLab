//
//  Manager.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

class Manager {
    static let shared = Manager()
    
    //MARK: DATABASE
    var database: DBManager = DBManager()
    
    //MARK: ANIMATIONS
    var login_anim = "login_anim"
    
    //MARK: GENERAL
    var errorTitle = "Oops! Something wrong"
    var successTitle = "Congratulation!"
    var infoTitle = "Great, All in!"
    
    //MARK: LOGIN & REGISTER
    var successLoginFormat = "I will check your account now"
    var successRegisterFormat = "I will add your account now"
    var successRegisterAccount = "Your account create successful"
    
    var errorEmailFormat = "Look like your email wrong format"
    var errorPwdFormat = "The password must be 6 - 10 characters :("
    var errorMobileFormat = "Wait! Your phone don't exist"
    var errorRegisterAccount = "Look like email already exist"
    var errorLoginAccount = "Maybe email or password is invalid"
    
    //MARK: HOME
    var rightBarItemStartActivity = "Start activity"
    var rightBarItemDashboard = "Dashboard"
    var titleHome = "YOUR DASHBOARD"
    var captureHome = "YOUR CAPTURE"
    var noDataHome = "List has no data\nPlease start activity to add more"
    
    var successStoreYourData = "Your data store successful"
    
    var errorCaptureImage = "Please try with other capture"
    var errorStoreYourData = "Please capture other photo"
    
    //MARK: GET CURRENT TIME
    func getCurrentTime() -> String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.string(from: currentDateTime)
    }
    
    //MARK: STORE IMAGE
    func storeImage(_ image: UIImage, fileName: String, handler: @escaping (Response, String) -> ()) {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("\(fileName).png")
            if let pngImageData = image.pngData() {
                try pngImageData.write(to: fileURL, options: .atomic)
                handler(.success, "\(fileName).png")
            }
        } catch let error {
            print("\(error)")
            handler(.failed, "")
        }
    }
    
    //MARK: LOAD IMAGE
    func loadImage(_ fileName: String) -> UIImage {
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if let dirPath = paths.first{
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageURL.path)
            return image ?? #imageLiteral(resourceName: "null_image")
        }
        return #imageLiteral(resourceName: "null_image")
    }
    
    //MARK: RANDOM STRING
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
