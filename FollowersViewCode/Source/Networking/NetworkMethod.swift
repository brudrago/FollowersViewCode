//
//  NetworkMethod.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Alamofire

enum NetworkMethod {
    case get
    case post
    case put
    case patch
    case delete
    
    var httpMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .patch:
            return .patch
        case .delete:
            return .delete
        }
    }
}
