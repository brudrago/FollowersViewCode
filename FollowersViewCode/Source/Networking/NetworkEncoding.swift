//
//  NetworkEncoding.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Alamofire

enum NetworkEncoding {
    case URL
    case JSON
    
    var `default`: ParameterEncoding {
        switch self {
        case .URL:
            return URLEncoding.default
        case .JSON:
            return JSONEncoding.default
        }
    }
}
