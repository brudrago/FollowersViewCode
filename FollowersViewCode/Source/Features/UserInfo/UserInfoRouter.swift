//
//  UserInfoRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import Foundation
import SafariServices

protocol UserInfoRouterProtocol {
    
    func proceedToUserProfile()
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
    
    func proceedToUserProfile() {
//        let profileUrl = dataStore.user.htmlUrl
//        guard let url = URL(string: profileUrl) else { return }
//        let safariViewController = SFSafariViewController(url: url)
//        safariViewController.preferredControlTintColor = .systemGreen
//        viewController.present(safariViewController, animated: true)
    }
}
