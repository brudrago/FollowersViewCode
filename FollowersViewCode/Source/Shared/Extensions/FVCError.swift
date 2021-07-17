//
//  FVCError.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Foundation

enum FVCError: Error {
    case decodeError
    case networkError
    case invalidUsername
    case invalidData
    case unableToFavorite
    case alreadyInFavorites
}

extension FVCError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .decodeError:
            return R.Localizable.decodeError()
        case .networkError:
            return R.Localizable.networkError()
        case .invalidUsername:
            return R.Localizable.invalidUsername()
        case .invalidData:
            return R.Localizable.databaseError()
        case .unableToFavorite:
            return R.Localizable.unableToFavorite()
        case .alreadyInFavorites:
            return R.Localizable.alreadyInFavorites()
        }
    }
}
