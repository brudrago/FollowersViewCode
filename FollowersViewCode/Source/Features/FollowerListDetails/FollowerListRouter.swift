//
//  FollowerListRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 04/07/21.
//

import Foundation

protocol FollowerListRouterProtocol {
    
    func proceedToUserInfoDetails(follower: Follower)
}

class FollowerListRouter: FollowerListRouterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: FollowerListViewController!
    
    // MARK: - Public Functions
    
    func proceedToUserInfoDetails(follower: Follower) {
        let userInfoViewController = UserInfoBuilder.build(follower: follower)
        
        viewController.present(userInfoViewController, animated: true)
    }
}
