//
//  MainViewController.swift
//  DeepLinkSwift
//
//  Created by Phanha Uy on 1/29/19.
//  Copyright © 2019 Phanha Uy. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController { }

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        title = "Main Screen"
        
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
        
        let activityButton = UIBarButtonItem(title: "Activity", style: .plain, target: self, action: #selector(acitivityPressed))
        navigationItem.setRightBarButton(activityButton, animated: true)
    }
    
    @objc
    private func acitivityPressed(_ sender: Any) {
        self.showActivityScreen()
    }
    
    @objc
    private func logout() {
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        AppDelegate.shared.rootViewController.switchToLogout()
    }
    
    @objc
    func showActivityScreen(animated: Bool = true) {
        let activityViewController = ActivityViewController()
        navigationController?.pushViewController(activityViewController, animated: animated)
    }
}
