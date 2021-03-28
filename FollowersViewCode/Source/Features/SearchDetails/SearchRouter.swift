//
//  SearchRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import Foundation

protocol SearchRouterProtocol {
    
}

class SearchRouter: SearchRouterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: SearchVC!
    
    // MARK: - Public Functions
    
    func proceedToFollowerList(username: String) {
        let followerLisVC = FollowerListVC()
        followerLisVC.username = username
        followerLisVC.title = username
        
        viewController.navigationController?
            .pushViewController(followerLisVC, animated: true)
    }
}
