//
//  MasterViewController.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 13/08/2021.
//

import Foundation
import UIKit
import SnapKit
import Lottie


class MasterViewController: UIViewController {
    
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
    
    @objc
    func keyboardWillAppear() {
        //Detect keyboard show
    }
    
    @objc
    func keyboardWillDisappear() {
        //Detect keyboard hide
    }
    
    //MARK: LIFE CYCLE VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setMasterBackground()
        self.addView()
        self.setupConstraint()
        self.addNotificationCenter()
    }
    
    //MARK: LIFE CYCLE VIEWDIDAPPEAR
    override func viewDidAppear(_ animated: Bool) {
        self.controlSubView()
        self.setupAction()
    }
    
    //MARK: ON TOUCH THE SCREEN GESTURE
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension MasterViewController {
    //MARK: SET MASTER BACKGROUND COLOR
    fileprivate func setMasterBackground() {
        self.view.backgroundColor = .white
    }
    
    //MARK: ADD NOTIFICATION CENTER
    fileprivate func addNotificationCenter() {
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(keyboardWillDisappear),
                         name: UIResponder.keyboardWillHideNotification,
                         object: nil)
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(keyboardWillAppear),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
    }
}
