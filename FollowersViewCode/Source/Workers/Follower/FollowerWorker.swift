//
//  FollowerWorker.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Foundation

typealias FollowerListResults = (Result<[Follower]?,FVCError>) -> Void

protocol FollowerWorkerProtocol {
    
    var currentPage: Int { get }
    
    func fetchList(for username: String, completion: @escaping FollowerListResults)
    
    func nextPage()
}

class FollowerWorker: FollowerWorkerProtocol {
    
    var currentPage = 1
    
    // MARK: - Public Functions

    func fetchList(for username: String, completion: @escaping FollowerListResults) {
        let url = GithubURLBuilder(resource: .followers)
            .set(username: username)
            .set(page: currentPage)
            .buil()
        
        requestFollowers(url, completion: completion)
    }
    
    func nextPage() {
        self.currentPage += 1
    }
    
    // MARK: - Private Functions
    
    private func requestFollowers(_ url: String, completion: @escaping FollowerListResults) {
        NetworkManager.request(url: url) { result in
            completion(result)
        }
    }
}
