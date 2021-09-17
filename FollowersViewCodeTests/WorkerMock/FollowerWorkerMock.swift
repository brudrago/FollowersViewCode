//
//  FollowerWorkerMock.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 04/08/21.
//

import Foundation
@testable import FollowersViewCode

class FollowerWorkerMock: FollowerWorkerProtocol {
    
    var currentPage: Int = 0
    
    func fetchList(for username: String, completion: @escaping FollowerListResults) {
        let follower = Follower(login: "brudrago", avatarUrl: "")
        let followerListResults = [follower]
        
        completion(.success(followerListResults))
    }
    
    func nextPage() {
        self.currentPage += 1
    }
}

class FollowerWorkerFailedMock: FollowerWorkerProtocol {
    
    var currentPage: Int = 0
    
    func fetchList(for username: String, completion: @escaping FollowerListResults) {
        
        completion(.failure(.invalidData))
    }
    
    func nextPage() {
        self.currentPage += 1
    }
}
