//
//  FollowerListPresenter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 31/03/21.
//

import Foundation

// MARK: - VIP Properties

protocol FollowerListPresenterProtocol {
    
    func set(follower: [Follower])
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func showLoading()
    
    func dismissLoading()
}

class FollowerListPresenter: FollowerListPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: FollowerListViewControllerProtocol!
    
    //MARK: - Public Functions
    
    func set(follower: [Follower]) {
        viewController.set(follower: follower)
    }

    func showAlert(title: String, message: String, buttonTitle: String) {
        viewController.showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func showLoading() {
        viewController.showLoading()
    }
    
    func dismissLoading() {
        viewController.dismissLoading()
    }
}
