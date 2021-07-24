//
//  FavoriteListRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 17/07/21.
//

import Foundation

protocol FavoriteListRouterProtocol {
    
    func proceedToUserInfoDetails(follower: Follower)
}

class FavoriteListRouter: FavoriteListRouterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: FavoriteListVC!
    
    // MARK: - Public Functions
    
    func proceedToUserInfoDetails(follower: Follower) {
        let userInfoViewController = UserInfoBuilder.build(follower: follower)
        
        viewController.navigationController?
            .pushViewController(userInfoViewController, animated: true)
    }
}
