//
//  UIViewController+Extension.swift
//  RootControllerNavigation
//
//  Created by Phanha Uy on 1/28/19.
//  Copyright © 2019 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?, positiveButton: String? = "OK", positiveStyle: UIAlertActionStyle = .default, positiveCompletion: @escaping () -> () = {}, negativeButton: String? = nil, negativeCompletion: @escaping () -> () = {}) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: positiveButton, style: positiveStyle){ _ in
            positiveCompletion()
        })
        
        if let negative = negativeButton {
            alertController.addAction(UIAlertAction(title: negative, style: .cancel){ _ in
                negativeCompletion()
            })
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}
