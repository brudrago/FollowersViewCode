//
//  NetworkRequest.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Alamofire

struct NetworkRequest {
    
    var url: String
    
    var method: NetworkMethod
    
    var encoding: NetworkEncoding
    
    var parameters: [String: Any]?
}
