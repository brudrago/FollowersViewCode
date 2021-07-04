//
//  FollowerWorker.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Foundation

typealias FollowerResult = Result<Follower,FVCError>

typealias FollowerListResults = Result<[Follower],FVCError>

typealias FollowerCompletion = (Result<FollowerListResponse?,FVCError>) -> Void

protocol FollowerWorkerProtocol {
    
    func fetchList(for username: String, page: Int, completion: @escaping FollowerCompletion)
}

class FollowerWorker: FollowerWorkerProtocol {
    
    // MARK: - Private Properties
    
    private let networkManager: NetworkManagerProtocol
    
    // MARK: - Inits
    
    init() {
        self.networkManager = NetworkManager()
    }
    
    // MARK: - Public Functions
    
    func fetchList(for username: String, page: Int, completion: @escaping FollowerCompletion) {
        let url = GithubURLBuilder(resource: .followers)
            .set(username: username)
            .set(page: page)
            .buil()
        
        requestFollowers(url, completion: completion)
    }
    
    // MARK: - Private Functions
    
    private func requestFollowers(_ url: String, completion: @escaping FollowerCompletion) {
        let decoder = DefaultDecoder(for: FollowerListResponse.self)
        let request = NetworkRequest(url: url, method: .get, encoding: .JSON)
        
        networkManager.request(request, decoder: decoder) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
