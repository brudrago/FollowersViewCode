//
//  SearchRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 28/03/21.
//

import Foundation

protocol SearchRouterProtocol {
    
    func proceedToFollowerList(_ username: String?)
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
    
//    func proceedToFollowerList(username: String) {
//        let followerLisVC = FollowerListViewController()
//        followerLisVC.username = username
//        followerLisVC.title = username
//
//        viewController.navigationController?
//            .pushViewController(followerLisVC, animated: true)
//    }
    
    func proceedToFollowerList(_ username: String?) {
        let followerListViewController = FollowerListBuilder.build(username)
        
      //  guard let username = dataStore.username else { return }
        
        viewController.navigationController?
            .pushViewController(followerListViewController, animated: true)
    }
}
