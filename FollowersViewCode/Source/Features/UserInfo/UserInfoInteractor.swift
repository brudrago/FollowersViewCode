//
//  UserInfoInteractor.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import Foundation

protocol UserInfoInteractorProtocol {
    
    func fetchUser()
}

class UserInfoInteractor: UserInfoInteractorProtocol {
    
    //MARK: - VIP Properties
    
    var presenter: UserInfoPresenterProtocol!
    
    //MARK: - Private Properties
    
    private var userInfoWorker: UserInfoWorkerProtocol
    
     var follower: Follower!
    
    //MARK: - Inits
    
    init() {
        userInfoWorker = UserInfoWorker()
    }
    
    init(userInfoWorker: UserInfoWorkerProtocol) {
        self.userInfoWorker = userInfoWorker
    }
    
    //MARK: - Public Functions
    
    func fetchUser() {
        let username = follower.login
        userInfoWorker.fetchList(for: username) { [weak self] result in
           // guard let self = self else { return }
            
            switch result {
            case .success(let response):
               print("=====USER response:\(response)")
            case .failure (let error):
               print(error)
            }
        }
    }
    
}
