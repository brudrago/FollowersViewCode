//
//  FavoriteListTests.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 07/09/21.
//

import XCTest
@testable import FollowersViewCode

class FavoriteListTests: XCTestCase {
    
    // MARK: - Public Properties
    
    var persistenceWorker: PersistenceWorkerProtocol!
    
    // MARK: - Test Lifecycle
    
    override func setUp() {
        self.persistenceWorker = PersistenceWorkerMock()
    }
    
    // MARK: - Unit Tests

    func testInteractorInitialization() {
        let interactor = FavoriteListInteractor()
        XCTAssertNotNil(interactor)
    }
    
    func testGetFavorites() {
        let viewController = build()
        viewController.interactor.getFavorites()
        XCTAssertTrue(viewController.setCalled)
    }
    
    func testGetFavoritesFailed() {
        self.persistenceWorker = PersistenceFailedWorkerMock()
        let viewController = build()
        viewController.interactor.getFavorites()
        XCTAssertTrue(viewController.showAlertCalled)
    }
    
    func testDeleteFavorite() {
        let viewController = build()
        let favorite = Follower(login: "", avatarUrl: "")
        viewController.interactor.deleteFavorite(favorite)
        XCTAssertNotNil(favorite)
    }
    
    func testDeleteFavoriteFailed() {
        self.persistenceWorker = PersistenceFailedWorkerMock()
        let viewController = build()
        let favorite = Follower(login: "brudrago", avatarUrl: "")
        viewController.interactor.deleteFavorite(favorite)
        XCTAssertTrue(viewController.showAlertCalled)
    }
    
    // MARK: - Private Functions
    
    private func build() -> FavoriteDetailsViewControllerMock {
        let interactor = FavoriteListInteractor(
            persistenceWorker: persistenceWorker)
        
        let presenter = FavoriteListPresenter()
        let viewController = FavoriteDetailsViewControllerMock()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
