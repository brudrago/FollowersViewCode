//
//  UserWorkerMock.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 04/08/21.
//

import Foundation
@testable import FollowersViewCode

class UserWorkerMock: UserInfoWorkerProtocol {
    
    func fetchList(for username: String, completion: @escaping UserResult) {
        let user = User(login: "brudrago", avatarUrl: "", name: "Bruna", location: "California", bio: "", publicRepos: 1, publicGists: 1, followers: 1, following: 1, htmlUrl: "", createdAt: Date())
        
        completion(.success(user))
    }
}

class UserWorkerFailedMock: UserInfoWorkerProtocol {
    
    func fetchList(for username: String, completion: @escaping UserResult) {
        let user = User(login: "brudrago", avatarUrl: "", name: "Bruna", location: "California", bio: "", publicRepos: 0, publicGists: 0, followers: 0, following: 0, htmlUrl: "", createdAt: Date())
        
        completion(.failure(.invalidUsername))
    }
}
