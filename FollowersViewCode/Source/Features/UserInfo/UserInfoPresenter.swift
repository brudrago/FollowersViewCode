//
//  UserInfoPresenter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import Foundation

protocol UserInfoPresenterProtocol {
    
    func set(user: User)
    
    func showUserProfile(for url: String)
    
    func showAlert(title: String, message: String, buttonTitle: String)
    
    func showLoading()
    
    func dismissLoading()
}

class UserInfoPresenter: UserInfoPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: UserInfoViewControllerProtocol!
    
    //MARK: - Public Functions
    
    func set(user: User) {
        viewController.set(user: user)
    }
    
    func showUserProfile(for url: String) {
        viewController.showUserProfile(for: url)
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
