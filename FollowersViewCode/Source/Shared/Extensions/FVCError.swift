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
    case invalidData 
}

extension FVCError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return R.Localizable.networkError()
        case .invalidUsername:
            return R.Localizable.invalidUsername()
        case .invalidData:
            return R.Localizable.databaseError()
        }
    }
}
