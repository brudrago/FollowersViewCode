//
//  SearchViewDelegate.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 04/07/21.
//

import Foundation

protocol SearchViewDelegate: AnyObject {
    
    func getUsername(username: String)
    
    func didSelectSearchFollowerButton(username: String?)
}
