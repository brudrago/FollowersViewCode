//
//  PersistenceWorkerSnapMock.swift
//  FollowersViewCodeSnapTests
//
//  Created by Bruna Fernanda Drago on 09/11/21.
//

import Foundation
@testable import FollowersViewCode

class PersistenceWorkerSnapMock: PersistenceWorkerProtocol {
    
    func updateFavorites(favorite: Follower, actionType: PersistenceActionType, completion: @escaping PersistenceFailedResult) {
       
        completion(.alreadyInFavorites)
    }
    
    func retrieveFavoriteFollower(completion: @escaping PersistenceResults) {
        let follower = [
            Follower(login: "tester1", avatarUrl: ""),
            Follower(login: "tester2", avatarUrl: ""),
            Follower(login: "tester3", avatarUrl: ""),
            Follower(login: "tester4", avatarUrl: ""),
            Follower(login: "tester5", avatarUrl: "")
        ]
        let followerListResults = follower
        completion(.success(followerListResults))
    }
}
