//
//  SearchRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import Foundation

protocol SearchRouterProtocol {
    
    func proceedToFollowerList(username: String)
}

protocol SearchDataPassingProtocol {
    
    var dataStore: SearchDataStoreProtocol! { get }
}

class SearchRouter: SearchRouterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: SearchViewController!
    
    // MARK: - Public Properties
    
    var dataStore: SearchDataStoreProtocol!
    
    // MARK: - Public Functions
    
    func proceedToFollowerList(username: String) {
        let followerLisVC = FollowerListViewController()
        followerLisVC.username = username
        followerLisVC.title = username
        
        viewController.navigationController?
            .pushViewController(followerLisVC, animated: true)
    }
}
