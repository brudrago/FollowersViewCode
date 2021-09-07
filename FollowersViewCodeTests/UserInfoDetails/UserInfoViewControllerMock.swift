//
//  UserInfoViewControllerMock.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 07/09/21.
//

@testable import FollowersViewCode

class UserInfoViewControllerMock : UserInfoViewControllerProtocol {
    
    // MARK: - VIP Properties
    
    var interactor: UserInfoInteractorProtocol!
    
    // MARK: - Private Properties
    
    private(set) var setCalled = false
    
    private(set) var showUserCalled = false
    
    private(set) var showAlertCalled = false
    
    private(set) var showLoadingCalled = false
    
    private(set) var dismissLoadingCalled = false
    
    private(set) var url: String?
    
    private(set) var title: String?
    
    private(set) var message: String?
    
    private(set) var buttonTitle: String?
    
    // MARK: - Public Functions
    
    func set(user: User) {
        self.setCalled = true
    }
    
    func showUserProfile(for url: String) {
        self.showUserCalled = true
        self.url = url
    }
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        self.showAlertCalled = true
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    func showLoading() {
        self.showLoadingCalled = true
    }
    
    func dismissLoading() {
        self.dismissLoadingCalled = true
    }
}
