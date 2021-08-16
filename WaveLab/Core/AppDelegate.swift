//
//  AppDelegate.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 13/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //CREATE SQLite Database
        self.createSQLiteDB()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if UserDefaults.standard.value(forKey: Key.shared.USER_LOGIN) != nil {
            if UserDefaults.standard.value(forKey: Key.shared.USER_LOGIN) as? Bool == true {
                self.goToHome()
            } else {
                self.goToLogin()
            }
        } else {
            self.goToLogin()
        }
        
        return true
    }
    
    private func goToLogin() {
        let loginVC = LoginViewController()
        self.window?.rootViewController = loginVC
        self.window?.makeKeyAndVisible()
    }
    
    private func goToHome() {
        let homeVC = HomeViewController()
        let navi = UINavigationController(rootViewController: homeVC)
        self.window?.rootViewController = navi
        self.window?.makeKeyAndVisible()
    }
    
    //MARK: CREATE SQLITE DATABASE
    private func createSQLiteDB() {
        if Manager.shared.database.createDB() {
            print("DB create successful")
        } else {
            print("DB create falied")
        }
    }
}

