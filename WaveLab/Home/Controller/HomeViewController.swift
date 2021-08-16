//
//  HomeViewController.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

import Foundation
import UIKit

class HomeViewController: MasterNavigationController {
    
    //MARK: CONSTANTS
    private enum Constants {
        static let idCellTableView = "DataTableViewCell"
        static let textLatitude = "Latitude"
        static let textLongitude = "Longitude"
        static let textTime = "Date time"
        static let textSubmit = "Submit"
    }
    
    //MARK: VIEWMODEL
    var viewModel = HomeViewModel()
    
    //MARK: VARIABLES
    var listUserData: [UserData] = [UserData]()
    
    //MARK: COMPONENTS
    var lbHeader: HeaderLabel = {
        let lb = HeaderLabel(Manager.shared.titleHome)
        return lb
    }()
    
    var lbYourCapture: HeaderLabel = {
        let lb = HeaderLabel(Manager.shared.captureHome)
        lb.alpha = 0.0
        return lb
    }()
    
    var viewBoundStartActivity: UIView = {
        let view = UIView()
        view.alpha = 0.0
        return view
    }()
    
    var viewBoundDashboard: UIView = {
        let view = UIView()
        return view
    }()
    
    var lbNoData: SubContentLabel = {
        let lb = SubContentLabel(Manager.shared.noDataHome)
        lb.textAlignment = .center
        return lb
    }()
    
    var tableViewData: DefaultTableView = {
        let tv = DefaultTableView(frame: .zero, style: .plain)
        tv.alpha = 0.0
        return tv
    }()
    
    var imageCapture: CornerImageView = {
        let iv = CornerImageView(Dimension.shared.cornerImage, image: Images.shared.imagePlaceholder)
        return iv
    }()
    
    var lbLatitudeTitle: TitleLabel = {
        let lb = TitleLabel(Constants.textLatitude)
        return lb
    }()
    
    var lbLongitudeTitle: TitleLabel = {
        let lb = TitleLabel(Constants.textLongitude)
        return lb
    }()
    
    var lbTimeTitle: TitleLabel = {
        let lb = TitleLabel(Constants.textTime)
        return lb
    }()
    
    var lbLatitudeValue: ContentLabel = {
        let lb = ContentLabel("")
        return lb
    }()
    
    var lbLongitudeValue: ContentLabel = {
        let lb = ContentLabel("")
        return lb
    }()
    
    var lbTimeValue: ContentLabel = {
        let lb = ContentLabel("")
        return lb
    }()
    
    var btnSubmit: DynamicButton = {
        let btn = DynamicButton(Constants.textSubmit, style: .active)
        return btn
    }()
    
    //MARK: ADD COMPONENTS
    override func addView() {
        self.view.addSubview(self.lbHeader)
        self.view.addSubview(self.lbYourCapture)
        
        self.view.addSubview(self.viewBoundDashboard)
        self.viewBoundDashboard.addSubview(self.tableViewData)
        self.viewBoundDashboard.addSubview(self.lbNoData)
        
        self.view.addSubview(self.viewBoundStartActivity)
        self.viewBoundStartActivity.addSubview(self.imageCapture)
        self.viewBoundStartActivity.addSubview(self.lbLatitudeTitle)
        self.viewBoundStartActivity.addSubview(self.lbLongitudeTitle)
        self.viewBoundStartActivity.addSubview(self.lbTimeTitle)
        self.viewBoundStartActivity.addSubview(self.lbLatitudeValue)
        self.viewBoundStartActivity.addSubview(self.lbLongitudeValue)
        self.viewBoundStartActivity.addSubview(self.lbTimeValue)
        self.viewBoundStartActivity.addSubview(self.btnSubmit)
        
        self.tableViewData.delegate = self
        self.tableViewData.dataSource = self
        self.tableViewData.register(DataTableViewCell.self, forCellReuseIdentifier: Constants.idCellTableView)
    }
    
    //MARK: GET DATA
    override func getData() {
        self.fetchListData()
    }
    
    //MARK: FETCH LIST DATA
    fileprivate func fetchListData() {
        self.listUserData = self.viewModel.fetchAllData()

        if self.listUserData.count == 0 {
            self.lbNoData.alpha = 1.0
            self.tableViewData.alpha = 0.0
        } else {
            self.lbNoData.alpha = 0.0
            self.tableViewData.alpha = 1.0
        }

        self.tableViewData.reloadData()
    }
    
    //MARK: SETUP CONSTRAINT FOR COMPONENTS
    override func setupConstraint() {
        self.lbHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Dimension.shared.top + self.topBarHeight)
            make.left.equalToSuperview().offset(Dimension.shared.left)
        }
        
        self.lbYourCapture.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Dimension.shared.top + self.topBarHeight)
            make.left.equalToSuperview().offset(Dimension.shared.left)
        }
        
        self.viewBoundDashboard.snp.makeConstraints { make in
            make.top.equalTo(self.lbHeader.snp.bottom).offset(Dimension.shared.highSpacing)
            make.left.equalToSuperview().offset(Dimension.shared.left)
            make.right.equalToSuperview().offset(-Dimension.shared.right)
            make.bottom.equalToSuperview().offset(-Dimension.shared.bottom)
        }
        
        self.tableViewData.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-Dimension.shared.bottom)
        }
        
        self.lbNoData.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-Dimension.shared.highSpacing)
        }
        
        self.viewBoundStartActivity.snp.makeConstraints { make in
            make.top.equalTo(self.lbYourCapture.snp.bottom).offset(Dimension.shared.highSpacing)
            make.left.equalToSuperview().offset(Dimension.shared.left)
            make.right.equalToSuperview().offset(-Dimension.shared.right)
            make.bottom.equalToSuperview().offset(-Dimension.shared.extremeSpacing*2 - Dimension.shared.buttonHeight)
        }
        
        self.imageCapture.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Dimension.shared.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(Dimension.shared.home_multiImageCapture)
        }
        
        self.lbLatitudeTitle.snp.makeConstraints { make in
            make.top.equalTo(self.imageCapture.snp.bottom).offset(Dimension.shared.extremeSpacing)
            make.left.equalToSuperview()
        }
        
        self.lbLongitudeTitle.snp.makeConstraints { make in
            make.top.equalTo(self.lbLatitudeTitle.snp.bottom).offset(Dimension.shared.mediumSpacing)
            make.left.equalToSuperview()
        }
        
        self.lbTimeTitle.snp.makeConstraints { make in
            make.top.equalTo(self.lbLongitudeTitle.snp.bottom).offset(Dimension.shared.mediumSpacing)
            make.left.equalToSuperview()
        }
        
        self.lbLatitudeValue.snp.makeConstraints { make in
            make.top.equalTo(self.lbLatitudeTitle.snp.top)
            make.left.equalTo(self.lbLatitudeTitle.snp.right).offset(Dimension.shared.highSpacing)
        }
        
        self.lbLongitudeValue.snp.makeConstraints { make in
            make.top.equalTo(self.lbLongitudeTitle.snp.top)
            make.left.equalTo(self.lbLatitudeValue.snp.left)
        }
        
        self.lbTimeValue.snp.makeConstraints { make in
            make.top.equalTo(self.lbTimeTitle.snp.top)
            make.left.equalTo(self.lbLatitudeValue.snp.left)
        }
        
        self.btnSubmit.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.lbTimeTitle.snp.bottom).offset(Dimension.shared.extremeSpacing * 2)
            make.width.equalTo(self.viewBoundStartActivity.snp.width)
            make.height.equalTo(Dimension.shared.buttonHeight)
        }
    }
    
    //MARK: ACTION FOR COMPONENTS
    override func setupAction() {
        self.btnSubmit.touchUpInside(self, #selector(self.storeData))
    }
    
    //MARK: ADD RIGHT BAR ITEM
    override func addRightBarItem() {
        self.changeRightBarItem(title: Manager.shared.rightBarItemStartActivity,
                                selector: #selector(self.startActivity))
    }
}

extension HomeViewController {
    //MARK: CHANGE RIGHT BAR ITEM
    fileprivate func changeRightBarItem(title: String, selector: Selector) {
        let item = UIBarButtonItem().setTitle(title, target: self, selector: selector)
        navigationItem.rightBarButtonItem = item
    }
    
    //MARK: STORE DATA
    @objc
    fileprivate func storeData() {
        let image = self.imageCapture.image
        let fileName = Manager.shared.randomString(length: 6)
        let latitude = self.lbLatitudeValue.getText()
        let longitude = self.lbLongitudeValue.getText()
        let time = self.lbTimeValue.getText()
        
        self.viewModel.storeImageToLocal(image,
                                         fileName: fileName)
        { filePath in
            self.viewModel.saveData(filePath: filePath,
                                    lat: latitude,
                                    lng: longitude,
                                    time: time)
            { response in
                switch response {
                case .success:
                    BannerNotification.shared
                        .show(title: Manager.shared.successTitle,
                              description: Manager.shared.successStoreYourData,
                              style: .success)
                    
                    self.switchToDashboard()
                case .failed:
                    BannerNotification.shared
                        .show(title: Manager.shared.errorTitle,
                              description: Manager.shared.errorStoreYourData,
                              style: .danger)
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: NUMBER OF ROWS IN TABLE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listUserData.count
    }
    
    //MARK: CELLS IN TABLE
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.idCellTableView) as! DataTableViewCell
        cell.setupData(data: self.listUserData[indexPath.row])
        return cell
    }
    
    //MARK: CELLS HEIGHT
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Dimension.shared.home_userDataCellHeight
    }
}

extension HomeViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    //MARK: START ACTIVITY ACTION
    @objc
    fileprivate func startActivity() {
        let cameraVc = UIImagePickerController()
        cameraVc.sourceType = .camera
        cameraVc.allowsEditing = true
        cameraVc.delegate = self
        self.present(cameraVc, animated: true)
    }
    
    //MARK: PICK IMAGE FROM CAMERA ACTION
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            BannerNotification.shared.show(title: Manager.shared.errorTitle,
                                           description: Manager.shared.errorCaptureImage,
                                           style: .danger)
            return
        }
        
        self.imageCapture.image = image
        self.switchToStartActivity()
    }
    
    //MARK: SWITCH TO START ACTIVITY ACTION
    @objc
    fileprivate func switchToStartActivity() {
        Animation.shared.fadeIn(objects: [self.viewBoundStartActivity, self.lbYourCapture])
        Animation.shared.fadeOut(objects: [self.viewBoundDashboard, self.lbHeader])
        
        self.changeRightBarItem(title: Manager.shared.rightBarItemDashboard,
                                selector: #selector(self.switchToDashboard))
        
        self.lbLatitudeValue.text = "\(self.currentLat)"
        self.lbLongitudeValue.text = "\(self.currentLong)"
        self.lbTimeValue.text = Manager.shared.getCurrentTime()
    }
    
    //MARK: SWITCH TO DASHBOARD ACTION
    @objc
    fileprivate func switchToDashboard() {
        Animation.shared.fadeOut(objects: [self.viewBoundStartActivity, self.lbYourCapture])
        Animation.shared.fadeIn(objects: [self.viewBoundDashboard, self.lbHeader])
        
        self.changeRightBarItem(title: Manager.shared.rightBarItemStartActivity,
                                selector: #selector(self.startActivity))
        
        self.fetchListData()
    }
}
