//
//  PersistenceWorker.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 17/07/21.
//

import Foundation

typealias PersistenceResults = (Result<[Follower]?,FVCError>) -> Void

typealias PersistenceFailedResult = (FVCError?) -> Void

protocol PersistenceWorkerProtocol {
    
    func updateFavorites(favorite: Follower, actionType: PersistenceActionType, completion: @escaping PersistenceFailedResult)
    
    func retrieveFavoriteFollower(completion: @escaping PersistenceResults) 
}

class PersistenceWorker: PersistenceWorkerProtocol {
    
    func updateFavorites(favorite: Follower, actionType: PersistenceActionType, completion: @escaping PersistenceFailedResult) {
        
        retrieveFavoriteFollower { result in
            switch result {
            case .success(let favorites):
                var retrieveFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !(retrieveFavorites?.contains(favorite))! else {
                        completion(.alreadyInFavorites)
                        return
                    }
                    
                    retrieveFavorites?.append(favorite)
                    
                case .remove:
                    retrieveFavorites?.removeAll { $0.login == favorite.login }
                }
                
                completion(PersistenceManager.save(favorites: retrieveFavorites ?? []))
                
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    // MARK: - Private Functions
    
    func retrieveFavoriteFollower(completion: @escaping PersistenceResults) {
        PersistenceManager.retrieveFavorites { result in
            completion(result)
        }
    }
}
