//
//  FavoriteListViewDelegate.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/07/21.
//

import Foundation

protocol FavoriteListViewDelegate: AnyObject {
    
    func selectedFavorite(_ favoriteSelected: Follower)
    
    func deleteFavorite(_ favoriteSelected: Follower)
}
