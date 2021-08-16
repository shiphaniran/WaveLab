//
//  DataTableViewCell.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

import Foundation
import UIKit
import SnapKit

class DataTableViewCell: MasterTableViewCell {
    
    //MARK: COMPONENTS
    var imageCapture: CornerImageView = {
        let iv = CornerImageView(Dimension.shared.cornerImage, image: Images.shared.imagePlaceholder)
        return iv
    }()
    
    var viewBoundContent: UIView = {
        let view = UIView()
        return view
    }()
    
    var lbLatitudeTitle: TitleLabel = {
        let lb = TitleLabel("Lat")
        return lb
    }()
    
    var lbLongitudeTitle: TitleLabel = {
        let lb = TitleLabel("Lng")
        return lb
    }()
    
    var lbTimeTitle: TitleLabel = {
        let lb = TitleLabel("Time")
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
    
    //MARK: ADD COMPONENTS
    override func addView() {
        self.addSubview(self.imageCapture)
        self.addSubview(self.viewBoundContent)
        
        self.viewBoundContent.addSubview(self.lbLatitudeTitle)
        self.viewBoundContent.addSubview(self.lbLongitudeTitle)
        self.viewBoundContent.addSubview(self.lbTimeTitle)
        
        self.viewBoundContent.addSubview(self.lbLatitudeValue)
        self.viewBoundContent.addSubview(self.lbLongitudeValue)
        self.viewBoundContent.addSubview(self.lbTimeValue)
    }
    
    //MARK: SETUP CONSTRAINT OF COMPONENTS
    override func setupConstraint() {
        self.imageCapture.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-Dimension.shared.smallSpacing)
            make.left.equalToSuperview()
            make.width.equalTo(self.imageCapture.snp.height).multipliedBy(Dimension.shared.multiAspectImageInCell)
        }
        
        self.viewBoundContent.snp.makeConstraints { make in
            make.centerY.equalTo(self.imageCapture.snp.centerY)
            make.left.equalTo(self.imageCapture.snp.right).offset(Dimension.shared.mediumSpacing)
        }
        
        self.lbLatitudeTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        self.lbLongitudeTitle.snp.makeConstraints { make in
            make.top.equalTo(self.lbLatitudeTitle.snp.bottom).offset(Dimension.shared.smallSpacing)
            make.left.equalToSuperview()
        }
        
        self.lbTimeTitle.snp.makeConstraints { make in
            make.top.equalTo(self.lbLongitudeTitle.snp.bottom).offset(Dimension.shared.smallSpacing)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.lbLatitudeValue.snp.makeConstraints { make in
            make.centerY.equalTo(self.lbLatitudeTitle)
            make.left.equalTo(self.lbLatitudeTitle.snp.right).offset(Dimension.shared.smallSpacing)
        }
        
        self.lbLongitudeValue.snp.makeConstraints { make in
            make.centerY.equalTo(self.lbLongitudeTitle)
            make.left.equalTo(self.lbLongitudeTitle.snp.right).offset(Dimension.shared.smallSpacing)
        }
        
        self.lbTimeValue.snp.makeConstraints { make in
            make.centerY.equalTo(self.lbTimeTitle)
            make.left.equalTo(self.lbTimeTitle.snp.right).offset(Dimension.shared.smallSpacing)
        }
    }
    
    //MARK: SETUP DATA FOR CELL
    func setupData(data: UserData) {
        self.imageCapture.image = Manager.shared.loadImage(data.imageName.decode())
        self.lbLatitudeValue.text = data.latitude.decode()
        self.lbLongitudeValue.text = data.longitude.decode()
        self.lbTimeValue.text = data.time.decode()
    }
}
