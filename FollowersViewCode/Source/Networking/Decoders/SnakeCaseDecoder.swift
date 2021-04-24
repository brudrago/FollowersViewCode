//
//  SnakeCaseDecoder.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 24/04/21.
//

import Foundation

class SnakeCaseDecoder<T: Decodable>: DefaultDecoder<T> {
        
    // MARK: - Public functions
    
    override func decode(from data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(expectedType.self, from: data)
    }
}
