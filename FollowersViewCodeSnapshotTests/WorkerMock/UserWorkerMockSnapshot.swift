//
//  UserWorkerMockSnapshot.swift
//  FollowersViewCodeSnapshotTests
//
//  Created by Bruna Drago on 21/09/21.
//

import Foundation
@testable import FollowersViewCode

class UserWorkerMockSnapshot: UserInfoWorkerProtocol {
    
    func fetchList(for username: String, completion: @escaping UserResult) {
        let user = User(login: "tester1", avatarUrl: "", name: "Teste Snapshot", location: "California", bio: "", publicRepos: 1, publicGists: 1, followers: 1, following: 1, htmlUrl: "", createdAt: Date())
        
        completion(.success(user))
    }
}
