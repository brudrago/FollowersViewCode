//
//  FollowerListInteractor.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 31/03/21.
//

import Foundation

protocol FollowerListDataStoreProtocol {
    
    var username: String! { get set }
}

protocol FollowerListInteractorProtocol {
    
    func fetchFollowers()
    
    func set(follower: [Follower])
}

class FollowerListInteractor: FollowerListInteractorProtocol {
    
    var presenter: FollowerListPresenterProtocol!
    
    //MARK: - Public Properties
    
    var username: String!
    
    //MARK: - Private Properties
    
    private var followerWorker: FollowerWorkerProtocol
    
    private var page = 1
    
    private var followerList : [Follower] = []
    
    //MARK: - Inits
    
    init() {
        followerWorker = FollowerWorker()
    }
    
    init(followerWorker: FollowerWorkerProtocol) {
        self.followerWorker = followerWorker
    }
    
    //MARK: - Public Functions
    
    func fetchFollowers() {
        followerWorker.fetchList(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let followerResponse):
                self.didFetchSuccess(followerResponse)
            case .failure(let error):
                self.didFetchFailed()
                print(error)
            }
        }
    }
    
    func set(follower: [Follower]) {
        presenter.set(follower: follower)
    }
    
    //MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [Follower]?) {
        guard let followers = response else { return }
        presenter.set(follower: followers)
    }
    
    private func didFetchFailed(){
        let titleMessage = R.Localizable.sorry()
        let message = R.Localizable.somenthingBadHappend()
        let buttonTitle = R.Localizable.ok()
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
    }
}
