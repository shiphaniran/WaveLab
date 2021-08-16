//
//  MasterNavigationController.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

import Foundation
import UIKit
import SnapKit
import CoreLocation

class MasterNavigationController: UIViewController {
    
    /// Navagation bar height
    var topBarHeight: CGFloat = 0.0
    
    /// Current latitude coordinate
    var currentLat: Double = 0.0
    
    /// Current longitude coordinate
    var currentLong: Double = 0.0
    
    /// Location manager
    let locationManager = CLLocationManager()
    
    
    func addView() {
        //Add components into screen
    }
    
    func controlSubView() {
        //Custom components subview or layer
    }
    
    func setupConstraint() {
        //Setup components constraint
    }
    
    func setupAction() {
        //Setup components action
    }
    
    func addRightBarItem() {
        //Add item into right bar
    }
    
    func setData() {
        //Set data
    }
    
    func getData() {
        //Get data
    }
    
    //MARK: LIFE CYCLE VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setMasterBackground()
        self.requestLocationUsage()
        self.setBackgroundForNavigationBar()
        self.getTopBarHeight()
        
        self.addLeftBarItem()
        self.addRightBarItem()
        self.addView()
        self.setupConstraint()
        self.setData()
        self.getData()
    }
    
    //MARK: LIFE CYCLE VIEWDIDAPPEAR
    override func viewDidAppear(_ animated: Bool) {
        self.controlSubView()
        self.setupAction()
    }
}

extension MasterNavigationController: CLLocationManagerDelegate {
    //MARK: LOCATION MANAGER SYSTEM
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.currentLat = locValue.latitude
        self.currentLong = locValue.longitude
    }
    
    //MARK: GET NAVIGATIONBAR HEIGHT
    fileprivate func getTopBarHeight() {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        self.topBarHeight = statusHeight + (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    //MARK: SET NAVIGATION BACKGROUND COLOR
    fileprivate func setBackgroundForNavigationBar() {
        UINavigationBar.appearance().barTintColor = .white
    }
    
    //MARK: REQUEST USER LOCATION USAGE
    fileprivate func requestLocationUsage() {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: SET MASTER BACKGROUND COLOR
    fileprivate func setMasterBackground() {
        self.view.backgroundColor = .white
    }
    
    //MARK: ADD LEFT ITEM INTO NAVIGATION BAR
    fileprivate func addLeftBarItem() {
        let ivLogOut = Images.shared.logout.withTintColor(Theme.shared.primary)
        let logOutButton = UIBarButtonItem().setImage(ivLogOut, target: self, selector: #selector(self.logOut))
        navigationItem.leftBarButtonItem = logOutButton
    }
    
    //MARK: LOGOUT ACTION
    @objc
    fileprivate func logOut() {
        UserDefaults.standard.setValue(false, forKey: Key.shared.USER_LOGIN)
        
        let loginVC = LoginViewController()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = loginVC
    }
}
