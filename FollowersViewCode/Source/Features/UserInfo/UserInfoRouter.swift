//
//  UserInfoRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import Foundation
import SafariServices

protocol UserInfoRouterProtocol {
    
    func proceedToFollowersList()
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
    
    func proceedToFollowersList() {
        let userLogin = dataStore.user.login
        
        let followerListViewController = FollowerListBuilder.build(userLogin)
        followerListViewController.title = userLogin
        
        viewController.navigationController?
            .pushViewController(followerListViewController, animated: true)
    }
}
