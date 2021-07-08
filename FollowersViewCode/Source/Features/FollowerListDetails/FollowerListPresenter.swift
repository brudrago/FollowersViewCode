//
//  FollowerListPresenter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 31/03/21.
//

import Foundation

// MARK: - VIP Properties

protocol FollowerListPresenterProtocol {
    
    func set(follower: Follower)
}

class FollowerListPresenter: FollowerListPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: FollowerListViewControllerProtocol!
    
    //MARK: - Public Functions
    
    func set(follower: Follower) {
     //   viewController.set(follower: follower)
    }
}
