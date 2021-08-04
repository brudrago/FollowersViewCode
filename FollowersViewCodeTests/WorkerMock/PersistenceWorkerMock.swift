//
//  PersistenceWorkerMock.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 04/08/21.
//

@testable import FollowersViewCode

class PersistenceWorkerMock: PersistenceWorkerProtocol {
    
    func updateFavorites(favorite: Follower, actionType: PersistenceActionType, completion: @escaping PersistenceFailedResult) {
       
        completion(.alreadyInFavorites)
    }
    
    func retrieveFavoriteFollower(completion: @escaping PersistenceResults) {
        let follower = Follower(login: "", avatarUrl: "")
        let followerListResults = [follower]
        completion(.success(followerListResults))
    }
    
}

class PersistenceFailedWorkerMock: PersistenceWorkerProtocol {
    
    func updateFavorites(favorite: Follower, actionType: PersistenceActionType, completion: @escaping PersistenceFailedResult) {
       
        completion(.alreadyInFavorites)
    }
    
    func retrieveFavoriteFollower(completion: @escaping PersistenceResults) {
        
        completion(.failure(.alreadyInFavorites))
    }
    
}
