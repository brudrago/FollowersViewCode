//
//  FavoriteListPresenter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 17/07/21.
//

import Foundation

protocol FavoriteListPresenterProtocol {
    
    func set(favorite: [Follower])
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func showLoading()
    
    func dismissLoading()
    
    func showEmptyState(_ message: String)
}

class FavoriteListPresenter: FavoriteListPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: FavoriteListVCProtocol!
    
    //MARK: - Public Functions
    
    func set(favorite: [Follower]) {
        viewController.set(favorite: favorite)
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
    
    func showEmptyState(_ message: String) {
        viewController.showEmptyState(message)
    }
}
