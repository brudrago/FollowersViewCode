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
    
    func fetchFilteredFollowers(_ filter: String)
    
    func updateListFollowers()
}

class FollowerListInteractor: FollowerListInteractorProtocol {
    
    //MARK: - VIP Properties
    
    var presenter: FollowerListPresenterProtocol!
    
    //MARK: - Public Properties
    
    var username: String!
    
    //MARK: - Private Properties
    
    private var followerWorker: FollowerWorkerProtocol
    
    private var page = 1
    
    private var followerList : [Follower] = []
    
    private var filteredFollowerList : [Follower] = []
    
    private var hasMoreFollowers = true
    
    private var isSearching = false
    
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
    
    func fetchFilteredFollowers(_ filter: String) {
        isSearching = true
        filteredFollowerList = followerList.filter {
            $0.login.lowercased().contains(filter.lowercased())}
        
        presenter.set(follower: filteredFollowerList)
    }
    
    func updateListFollowers() {
        isSearching = false
        let updateList = followerList
        presenter.set(follower: updateList)
    }
    
    func selectedUserInfoDetails(_ follower: [Follower]) {
        let followerStatus = isSearching ? filteredFollowerList : followerList
       // followerStatus[indexPath]
    }
    
    //MARK: - Private Functions
    
    private func didFetchSuccess(_ response: [Follower]?) {
        guard let followers = response else { return }
        self.followerList.append(contentsOf: followers)
        if followers.isEmpty {
            DispatchQueue.main.async { self.didFetchEmptyState() }
            return
        }
        
        presenter.set(follower: followerList)
    }
    
    private func didFetchFailed(){
        let titleMessage = R.Localizable.sorry()
        let message = R.Localizable.somenthingBadHappend()
        let buttonTitle = R.Localizable.ok()
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
    }
    
    private func didFetchEmptyState() {
        let message = R.Localizable.emptyFollowers()
        presenter.showEmptyState(message)
    }
}
