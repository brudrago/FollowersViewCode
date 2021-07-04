//
//  URLBuilder.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Foundation

class GithubURLBuilder {
    
    // MARK: - Private Properties
    
    private var url: String
    
    
    
   // let endpoint = baseUrl + "/users/\(username)/followers?per_page=100&\(page)"
    
    // MARK: - Inits
    
    init(resource: GithubResource) {
        self.url = "\(GithubAPI.baseURL)"
    }
    
    // MARK: - Public Functions
    
    func set(username: String) -> GithubURLBuilder {
        self.url += "/users/\(username)"
        return self
    }
    
    func set(page: Int) -> GithubURLBuilder {
        self.url += "/followers?per_page=100&page=\(page)"
        return self
    }
    
    func buil() -> String {
        return url
    }
}
