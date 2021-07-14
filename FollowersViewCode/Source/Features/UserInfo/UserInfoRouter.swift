//
//  UserInfoRouter.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 10/07/21.
//

import Foundation
import SafariServices

protocol UserInfoRouterProtocol {
    
}

protocol UserInfoDataPassingProtocol {
    
    var dataStore: UserInfoDataStoreProtocol! { get }
}

class UserInfoRouter: UserInfoRouterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: UserInfoViewController!
    
    // MARK: - Public Properties
    
    var dataStore: UserInfoDataStoreProtocol!
    
    // MARK: - Public Functions

}
