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
    
    func fetchNextPage()
}

class FollowerListInteractor: FollowerListInteractorProtocol {
    
    var presenter: FollowerListPresenterProtocol!
    
    //MARK: - Public Properties
    
    var username: String!
    
    //MARK: - Private Properties
    
    private var followerWorker: FollowerWorkerProtocol
    
    private var page = 1
    
    private var followerList : [Follower] = []
    
    private var hasMoreFollowers = true
    
    //MARK: - Inits
    
    init() {
        followerWorker = FollowerWorker()
    }
    
    init(followerWorker: FollowerWorkerProtocol) {
        self.followerWorker = followerWorker
    }
    
    //MARK: - Public Functions
    
    func fetchFollowers() {
        presenter.showLoading()
        
        followerWorker.fetchList(for: username ) { [weak self] result in
            guard let self = self else { return }
            
            self.presenter.dismissLoading()
            
            switch result {
            case .success(let response):
                if response?.count ?? 0 < 100 { self.hasMoreFollowers = false }
                self.didFetchSuccess(response)
            case .failure:
                self.didFetchFailed()
            }
        }
    }
    
    func fetchNextPage() {
        if hasMoreFollowers {
            followerWorker.nextPage()
            fetchFollowers()
        }
    }
    
    //MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [Follower]?) {
        guard let followers = response else { return }
        self.followerList.append(contentsOf: followers)
        presenter.set(follower: followerList)
    }
    
    private func didFetchFailed(){
        let titleMessage = R.Localizable.sorry()
        let message = R.Localizable.somenthingBadHappend()
        let buttonTitle = R.Localizable.ok()
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
    }
}
