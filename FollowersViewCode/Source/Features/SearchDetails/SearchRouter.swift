//
//  SearchRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import Foundation

protocol SearchRouterProtocol {
    
    func proceedToFollowerList(_ username: String?)
    
    func proceedToFollowerList()
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
    
    func proceedToFollowerList(_ username: String?) {
        let followerListViewController = FollowerListBuilder.build(username)
        
        viewController.navigationController?
            .pushViewController(followerListViewController, animated: true)
    }
    
    func proceedToFollowerList() {
        guard let username = dataStore.username else { return }
        
        let followerListViewController = FollowerListBuilder.build(username)
        viewController.navigationController?
            .pushViewController(followerListViewController, animated: true)
    }
}
