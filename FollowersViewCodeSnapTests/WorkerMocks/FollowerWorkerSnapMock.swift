//
//  FollowerWorkerSnapMock.swift
//  FollowersViewCodeSnapTests
//
//  Created by Bruna Fernanda Drago on 09/11/21.
//

import Foundation
@testable import FollowersViewCode

class FollowerWorkerSnapMock: FollowerWorkerProtocol {
    
    var currentPage: Int = 0
    
    func fetchList(for username: String, completion: @escaping FollowerListResults) {
        let follower = [
            Follower(login: "brudrago", avatarUrl: ""),
            Follower(login: "tester1", avatarUrl: ""),
            Follower(login: "tester2", avatarUrl: ""),
            Follower(login: "tester3", avatarUrl: ""),
            Follower(login: "tester4", avatarUrl: ""),
            Follower(login: "tester5", avatarUrl: "")
        ]
        let followerListResults = follower
        
        completion(.success(followerListResults))
    }
    
    func nextPage() {
        self.currentPage += 1
    }
}
