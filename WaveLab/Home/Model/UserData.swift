//
//  UserData.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 16/08/2021.
//

import Foundation

struct UserData {
    
    /// Name of image
    let imageName: String
    
    /// Latitude of current image captured
    let latitude: String
    
    /// Longitude of current image captured
    let longitude: String
    
    /// Time of current image captured
    let time: String
    
    //MARK: SET DATA
    init(json: [String: Any]) {
        self.imageName = json["imageName"] as? String ?? ""
        self.latitude = json["latitude"] as? String ?? ""
        self.longitude = json["longitude"] as? String ?? ""
        self.time = json["time"] as? String ?? ""
    }
}
