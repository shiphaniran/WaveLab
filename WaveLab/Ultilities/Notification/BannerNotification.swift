//
//  ErrorNotification.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

import Foundation
import NotificationBannerSwift


class BannerNotification {
    static let shared = BannerNotification()
    
    //MARK: SHOW NOTIFICATION BANNER
    func show(title: String, description: String, style: BannerStyle) {
        let banner =
        GrowingNotificationBanner(
            title: title,
            subtitle: description,
            style: style)
        banner.duration = 0.8
        banner.show()
    }
}
