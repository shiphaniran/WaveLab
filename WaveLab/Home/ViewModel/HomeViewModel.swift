//
//  HomeViewModel.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 16/08/2021.
//

import Foundation
import UIKit

class HomeViewModel: NSObject {
    
    //MARK: INIT VIEWMODEL
    override init() {
        super.init()
    }
    
    //MARK: STORE IMAGE TO LOCAL
    func storeImageToLocal(_ image: UIImage?, fileName: String, handler: @escaping (String) -> ()) {
        if let imageOK = image {
            Manager.shared.storeImage(imageOK, fileName: fileName)
            { response, filePath in
                switch response {
                case.success:
                    handler(filePath)
                case .failed:
                    handler("")
                }
            }
        } else {
            handler("")
        }
    }
    
    //MARK: SAVE USER INTO USERACCOUNT TABLE SQLITE
    func saveData(filePath: String, lat: String, lng: String, time: String, handler: @escaping (Response) -> ()) {
        let filePathEncode = filePath.encode()
        let latitudeEncode = lat.encode()
        let longitudeEncode = lng.encode()
        let timeEncode = time.encode()
        
        if Manager.shared.database.saveData(filePathEncode,
                                            latitude: latitudeEncode,
                                            longitude: longitudeEncode,
                                            time: timeEncode) {
            handler(.success)
        } else {
            handler(.failed)
        }
    }
    
    //MARK: FETCH ALL DATA IN USERACCOUNT TABLE
    func fetchAllData() -> [UserData] {
        var listResult = [UserData]()
        
        for part in Manager.shared.database.getAllData() {
            let data = part as? [String: Any]
            
            if let dataOK = data {
                let userData = UserData(json: dataOK)
                listResult.append(userData)
            }
        }
        
        return listResult
    }
}
