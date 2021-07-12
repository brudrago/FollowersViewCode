//
//  UserInfoInteractor.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import Foundation

protocol UserInfoDataStoreProtocol {
    
    var user: User! { get set }
}

protocol UserInfoInteractorProtocol {
    
    func fetchUser()
    
    func showUserProfile()
}

class UserInfoInteractor: UserInfoInteractorProtocol {
    
    //MARK: - VIP Properties
    
    var presenter: UserInfoPresenterProtocol!
    
    //MARK: - Public Properties
    
    var follower: Follower!
    
    //MARK: - Private Properties
    
    private var userInfoWorker: UserInfoWorkerProtocol
    
    private var user: User?
    
     
    //MARK: - Inits
    
    init() {
        userInfoWorker = UserInfoWorker()
    }
    
    init(userInfoWorker: UserInfoWorkerProtocol) {
        self.userInfoWorker = userInfoWorker
    }
    
    //MARK: - Public Functions
    
    func fetchUser() {
        presenter.showLoading()
        
        let username = follower.login
        userInfoWorker.fetchList(for: username) { [weak self] result in
            guard let self = self else { return }
            
            self.presenter.dismissLoading()
            
            switch result {
            case .success(let response):
                self.didFetchSuccess(response)
                print("=====USER response:\(String(describing: response))")
            case .failure:
                self.didFetchFailed()
            }
        }
    }
    
    func showUserProfile() {
        guard let profileURL = user?.htmlUrl else { return}
        
        presenter.showUserProfile(for: profileURL)
    }
    
    //MARK: - Private Functions
    
    private func didFetchSuccess(_ response: User?) {
        guard let user = response else { return }
        self.user = user
        
        presenter.set(user: user)
    }
    
    private func didFetchFailed() {
        let titleMessage = R.Localizable.sorry()
        let message = R.Localizable.somenthingBadHappend()
        let buttonTitle = R.Localizable.ok()
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
    }
    
}
