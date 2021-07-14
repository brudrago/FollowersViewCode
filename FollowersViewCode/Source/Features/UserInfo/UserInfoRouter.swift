//
//  UserInfoRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import Foundation
import SafariServices

protocol UserInfoRouterProtocol {
    
    func proceedToUserProfile(for url: String)
}

protocol UserInfoDataPassingProtocol {
    
    var dataStore: UserInfoDataStoreProtocol! { get }
}

class UserInfoRouter: UserInfoRouterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: UserInfoViewController!
    
    // MARK: - Public Properties
    
    var dataStore: UserInfoDataStoreProtocol!
    
    // MARK: - Public Functions
    
    func proceedToUserProfile(for url: String) {
        guard let profileURL = URL(string: url) else { return }
        let safariViewController = SFSafariViewController(url: profileURL)
        safariViewController.preferredControlTintColor = .systemGreen
        viewController.present(safariViewController, animated: true)
    }
}
