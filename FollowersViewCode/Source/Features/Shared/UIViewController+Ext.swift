//
//  UIViewController+Ext.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 02/04/21.
//

import UIKit

extension UIViewController {
    
    func  presentFVCAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = FVCAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
