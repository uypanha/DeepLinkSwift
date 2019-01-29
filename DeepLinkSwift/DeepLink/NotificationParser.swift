//
//  NotificationParser.swift
//  DeepLinkSwift
//
//  Created by Phanha Uy on 1/29/19.
//  Copyright © 2019 Phanha Uy. All rights reserved.
//

import Foundation
import UIKit

class NotificationParser {
    static let shared = NotificationParser()
    private init() { }
    
    func handleNotification(_ userInfo: [AnyHashable : Any]) -> DeeplinkType? {
        if let data = userInfo["data"] as? [String: Any] {
            if let messageId = data["messageId"] as? String {
                return DeeplinkType.messages(.details(id: messageId))
            }
            if let requestId = data["requestId"] as? String {
                return DeeplinkType.request(.details(id: requestId))
            }
        }
        return nil
    }
}
