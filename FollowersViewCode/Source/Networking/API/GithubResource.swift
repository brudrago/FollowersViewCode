//
//  GithubResource.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Foundation

enum GithubResource: String {
    case followers
    case users
}

struct GithubAPI {
    
    // MARK: - Public Properties
    
    static let baseURL: String = "https://api.github.com"
}
