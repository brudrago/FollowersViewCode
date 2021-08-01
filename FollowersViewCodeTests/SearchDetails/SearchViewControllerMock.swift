//
//  SearchViewControllerMock.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 01/08/21.
//

@testable import FollowersViewCode

class SearchViewControllerMock: SearchViewControllerProtocol {
    
    // MARK: - VIP Properties
    
    var interactor: SearchInteractorProtocol!
    
    // MARK: - Private Properties
    
    private(set) var showAlertCalled = false
    
    private(set) var searchFollowersCalled = false
    
    private(set) var title: String?
    
    private(set) var message: String?
    
    private(set) var buttonTitle: String?
    
    // MARK: - Public Functions
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        self.showAlertCalled = true
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    func searchFollowers() {
        self.searchFollowersCalled = true
    }
}
