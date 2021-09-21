//
//  PersistenceWorkerMockSnapshot.swift
//  FollowersViewCodeSnapshotTests
//
//  Created by Bruna Drago on 21/09/21.
//

import Foundation
@testable import FollowersViewCode

class PersistenceWorkerMockSnapshot: PersistenceWorkerProtocol {
    
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
