//
//  FVCError.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Foundation

enum FVCError: Error {
    case networkError
    case invalidUsername
    case unableToComplete
    case invalidResponse
    case invalidData 
}

extension FVCError: LocalizedError {
    
}
