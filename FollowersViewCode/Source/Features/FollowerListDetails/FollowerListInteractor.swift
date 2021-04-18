//
//  FollowerListInteractor.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 31/03/21.
//

import Foundation

protocol FollowerListInteractorProtocol {
    
    func getFollowers(username: String)
}

class FollowerListInteractor: FollowerListInteractorProtocol {
    
    var presenter: FollowerListPresenterProtocol!
    
    
    func getFollowers(username: String) {
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMsg in
            guard let followers = followers else {
                print("erroooooo")
                return
            }
            
            print("Followers.count = \(followers.count)")
            print(followers)
        }
    }
}
