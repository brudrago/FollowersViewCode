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
            print(result)
            switch result {
            case .success(let followerResponse):
                self?.didFetchSuccess(followerResponse)
                self?.update(followerResponse)
            case .failure(let error):
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
        self.followerList.append(contentsOf: followers)
        print("===== LIST => \(followerList)")
    }
    
    private func update(_ response: [Follower]?) {
        guard let followers = response else { return }
        presenter.set(follower: followers)
    }
    
    private func didFetchFailed(){
        //TO DO : - tratamento para quando falha
    }
}
