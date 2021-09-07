//
//  FavoriteDetailsViewControllerMock.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 07/09/21.
//

@testable import FollowersViewCode

class FavoriteDetailsViewControllerMock: FavoriteListVCProtocol {
    
    // MARK: - VIP Properties
    
    var interactor: FavoriteListInteractorProtocol!
    
    // MARK: - Private Properties
    
    private(set) var setCalled = false
    
    private(set) var showAlertCalled = false
    
    private(set) var title: String?
    
    private(set) var message: String?
    
    private(set) var buttonTitle: String?
    
    private(set) var showLoadingCalled = false
    
    private(set) var dismissLoadingCalled = false
    
    private(set) var showEmptyStateCalled = false
    
    private(set) var emptyStateMessage: String?
    
    // MARK: - Public Functions
    
    func set(favorite: [Follower]) {
        self.setCalled = true
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
    
    func showEmptyState(_ message: String) {
        self.showEmptyStateCalled = true
        self.emptyStateMessage = message
    }
}
