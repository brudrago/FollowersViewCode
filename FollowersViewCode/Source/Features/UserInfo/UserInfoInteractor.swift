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
    
    func checkForUserFollowers()
}

class UserInfoInteractor: UserInfoInteractorProtocol, UserInfoDataStoreProtocol {
    
    //MARK: - VIP Properties
    
    var presenter: UserInfoPresenterProtocol!
    
    //MARK: - Public Properties
    
    var follower: Follower!
    
    //MARK: - Private Properties
    
    private var userInfoWorker: UserInfoWorkerProtocol
    
    //MARK: - Public Properties
    
    var user: User!
    
     
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
            case .failure:
                self.didFetchFailed()
            }
        }
    }
    
    func showUserProfile() {
        guard let profileURL = user?.htmlUrl else {
            self.didFetchFailed()
            return
        }
        
        presenter.showUserProfile(for: profileURL)
    }
    
    func checkForUserFollowers() {
        guard user.followers != 0 else {
            let title = R.Localizable.sorry()
            let message = R.Localizable.theresNoFollowers()
            let buttonTitle = R.Localizable.ok()
            presenter.showAlert(title: title, message: message, buttonTitle: buttonTitle)
            return
        }
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
