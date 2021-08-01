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
    
    func cleanAndUpdateListResultsAfterSearch()
    
    func updateListFollowers()
    
    func addFollowerInFavoriteList()
}

class FollowerListInteractor: FollowerListInteractorProtocol {
    
    //MARK: - VIP Properties
    
    var presenter: FollowerListPresenterProtocol!
    
    //MARK: - Public Properties
    
    var username: String!
    
    //MARK: - Private Properties
    
    private var followerWorker: FollowerWorkerProtocol
    
    private var userWorker: UserInfoWorkerProtocol
    
    private var persistenceWorker: PersistenceWorkerProtocol
    
    private var page = 1
    
    private var followerList : [Follower] = []
    
    private var filteredFollowerList : [Follower] = []
    
    private var hasMoreFollowers = true
    
    private var isLoadingMoreFollowers = false
    
    //MARK: - Inits
    
    init() {
        followerWorker = FollowerWorker()
        userWorker = UserInfoWorker()
        persistenceWorker = PersistenceWorker()
    }
    
    init(followerWorker: FollowerWorkerProtocol, userWorker: UserInfoWorkerProtocol, persistenceWorker: PersistenceWorkerProtocol) {
        self.followerWorker = followerWorker
        self.userWorker = userWorker
        self.persistenceWorker = persistenceWorker
    }
    
    //MARK: - Public Functions
    
    func fetchFollowers() {
        presenter.showLoading()
        isLoadingMoreFollowers = true
        
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
            self.isLoadingMoreFollowers = false
        }
    }
    
    func fetchNextPage() {
        if hasMoreFollowers && !isLoadingMoreFollowers {
            followerWorker.nextPage()
            fetchFollowers()
        }
    }
    
    func fetchFilteredFollowers(_ filter: String) {
        filteredFollowerList = followerList.filter {
            $0.login.lowercased().contains(filter.lowercased())}
        
        presenter.set(follower: filteredFollowerList)
    }
    
    func cleanAndUpdateListResultsAfterSearch() {
        filteredFollowerList.removeAll()
        presenter.set(follower: followerList)
    }
    
    func updateListFollowers() {
        let updateList = followerList
        presenter.set(follower: updateList)
    }
    
    func addFollowerInFavoriteList() {
        presenter.showLoading()
        
        userWorker.fetchList(for: username) { [weak self] result in
            guard let self = self else { return }
            self.presenter.dismissLoading()
            
            switch result {
            case .success(let user):
                self.didAddFavorite(user)
            case .failure(let error):
                print(error)
                self.didFetchFailed()
            }
        }
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
    
    private func didAddFavorite(_ user: User?) {
        guard let favoriteUser = user else { return }
        let favorite = Follower(login: favoriteUser.login, avatarUrl: favoriteUser.avatarUrl)
        persistenceWorker.updateFavorites(favorite: favorite, actionType: .add) { [weak self] error in
            guard let self = self else { return }
            
            guard let _ = error else {
                self.didAddFavoriteSucceedMessage()
                return
            }
            self.didFetchFailed()
        }
        
    }
    
    private func didAddFavoriteSucceedMessage() {
        let titleMessage = R.Localizable.favorite()
        let message = R.Localizable.newFavoriteAdd()
        let buttonTitle = R.Localizable.ok()
        presenter.showAlert(title: titleMessage, message: message, buttonTitle: buttonTitle)
    }
}
