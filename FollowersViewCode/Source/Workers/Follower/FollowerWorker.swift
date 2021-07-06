//
//  FollowerWorker.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Foundation

typealias FollowerListResults = (Result<[Follower]?,FVCError>) -> Void

protocol FollowerWorkerProtocol {
    
    func fetchList(for username: String, page: Int, completion: @escaping FollowerListResults)
}

class FollowerWorker: FollowerWorkerProtocol {
    
    // MARK: - Public Functions
    
    func fetchList(for username: String, page: Int, completion: @escaping FollowerListResults) {
        let url = GithubURLBuilder(resource: .followers)
            .set(username: username)
            .set(page: page)
            .buil()
        
        requestFollowers(url, completion: completion)
    }
    
    // MARK: - Private Functions
    
    private func requestFollowers(_ url: String, completion: @escaping FollowerListResults) {
        NetworkManager.request(url: url) { result in
            completion(result)
        }
    }
}
