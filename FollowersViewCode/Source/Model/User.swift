//
//  User.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 18/04/21.
//

import Foundation

struct User: Codable {
    
    var login      : String
    
    var avatarUrl  : String
    
    var name       : String?
    
    var location   : String?
    
    var bio        : String?
    
    var publicRepos: Int
    
    var publicGists: Int
    
    var followers  : Int
    
    var following  : Int
    
    var htmlUrl    : String
    
    var createdAt  : String
}
