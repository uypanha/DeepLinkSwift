//
//  DeepLinkManager.swift
//  DeepLinkSwift
//
//  Created by Phanha Uy on 1/29/19.
//  Copyright © 2019 Phanha Uy. All rights reserved.
//

import Foundation
import UIKit

// MARK: A single tool to rule them all
enum DeeplinkType {
    enum Messages {
        case root
        case details(id: String)
    }
    
    case messages(Messages)
    case activity
    case request(Messages)
}

let Deeplinker = DeepLinkManager()
class DeepLinkManager {
    fileprivate init() {}
    
    private var deeplinkType: DeeplinkType?
    
    @discardableResult
    func handleShortcut(item: UIApplicationShortcutItem) -> Bool {
        deeplinkType = ShortcutParser.shared.handleShortcut(item)
        return deeplinkType != nil
    }
    
    @discardableResult
    func handleDeeplink(url: URL) -> Bool {
        deeplinkType = DeeplinkParser.shared.parseDeepLink(url)
        return deeplinkType != nil
    }
    
    func handleRemoteNotification(_ notification: [AnyHashable: Any]) {
        deeplinkType = NotificationParser.shared.handleNotification(notification)
    }
    
    // check existing deepling and perform action
    func checkDeepLink() {
        AppDelegate.shared.rootViewController.deeplink = deeplinkType
        
        // reset deeplink after handling
        self.deeplinkType = nil
    }
}
