//
//  PersistenceManager.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 17/07/21.
//

import Foundation

typealias PersistenceResult<T: Decodable> = ((Result<T?, FVCError>) -> Void)

protocol PersistenceManagerProtocol {
    
    static func retrieveFavorites<T: Decodable>(completion: @escaping PersistenceResult<T>)
    
    static func save<T: Encodable>(favorites: [T]) -> FVCError?
}

class PersistenceManager: PersistenceManagerProtocol {
    
    // MARK: - Private Properties
    
    static private let defaults = UserDefaults.standard
    
    // MARK: - Enum
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    // MARK: - Inits
    
    init() {}
    
    // MARK: - Public Functions
    
//    static func retrieveFavorites(completed: @escaping (Result<[Follower], FVCError>) -> Void) {
//         guard let favoritesD = defaults.object(forKey: Keys.favorites) as? Data else {
//             completed(.success([]))
//             return
//         }
//
//         do {
//             let decoder = JSONDecoder()
//             let favorites = try decoder.decode([Follower].self, from: favoritesD)
//             completed(.success(favorites))
//         } catch {
//             completed(.failure(.unableToFavorite))
//         }
//     }
    
    static func retrieveFavorites<T: Decodable>(completion: @escaping PersistenceResult<T>) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completion(.success([] as? T))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let results = try decoder.decode(T.self, from: favoritesData)
            print("====RESULTS \(results)")
            return completion(.success(results))
            
        } catch {
            return completion(.failure(.unableToFavorite))
        }
    }
    
    static func save<T: Encodable>(favorites: [T]) -> FVCError? {
        do {
            let encoder = JSONEncoder()
            let encodeFavorites = try encoder.encode(favorites)
            defaults.set(encodeFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
