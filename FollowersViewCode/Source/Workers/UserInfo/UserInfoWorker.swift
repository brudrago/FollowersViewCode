//
//  UserInfoWorker.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import Foundation

typealias UserResult = (Result<User?,FVCError>) -> Void

protocol UserInfoWorkerProtocol {
    
    func fetchList(for username: String, completion: @escaping UserResult)
}

class UserInfoWorker: UserInfoWorkerProtocol {
    
    func fetchList(for username: String, completion: @escaping UserResult) {
        let url = GithubURLBuilder(resource: .users)
            .set(username: username)
            .buil()
        
        requestFollowers(url, completion: completion)
    }
    
    // MARK: - Private Functions
    
    private func requestFollowers(_ url: String, completion: @escaping UserResult) {
        NetworkManager.request(url: url) { result in
            completion(result)
        }
    }

}
