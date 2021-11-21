//
//  FollowerListTests.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 01/08/21.
//

import XCTest
@testable import FollowersViewCode

class FollowerListTests: XCTestCase {
    
    // MARK: - Public Properties
    
    var followerWorker: FollowerWorkerProtocol!
    
    var userWorker: UserInfoWorkerProtocol!
    
    var persistenceWorker: PersistenceWorkerProtocol!
    
    // MARK: - Test Lifecycle
    
    override func setUp() {
        self.followerWorker = FollowerWorkerMock()
        self.userWorker = UserWorkerMock()
        self.persistenceWorker = PersistenceWorkerMock()
    }

    // MARK: - Unit Tests

    func testInteractorInitialization() {
        let interactor = FollowerListInteractor()
        XCTAssertNotNil(interactor)
    }
    
    func testFetchFollowers() {
        let viewController = build()
        viewController.interactor.fetchFollowers()
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.dismissLoadingCalled)
    }
    
    func testFetchFollowersFailed() {
        self.followerWorker = FollowerWorkerFailedMock()
        let viewController = build()
        
        viewController.interactor.fetchFollowers()
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.showAlertCalled)
    }
    
    func testFetchNextPage() {
        let viewController = build()
        viewController.interactor.fetchNextPage()
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.dismissLoadingCalled)
    }
    
    func testFetchNextPageFailed() {
        self.followerWorker = FollowerWorkerFailedMock()
        let viewController = build()
        viewController.interactor.fetchNextPage()
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.dismissLoadingCalled)
    }
    
    func testFetchFilteredFollowers() {
        let viewController = build()
        let filter = "brudrago"
        viewController.interactor.fetchFilteredFollowers(filter)
        XCTAssertTrue(viewController.setCalled)
    }
    
    func testFetchFilteredFollowersFailed() {
        let viewController = build()
        let filter = ""
        viewController.interactor.fetchFilteredFollowers(filter)
        XCTAssertTrue(viewController.setCalled)
    }
    
    func testCleanAndUpdateListResultsAfterSearch() {
        let viewController = build()
        viewController.interactor.cleanAndUpdateListResultsAfterSearch()
        XCTAssertTrue(viewController.setCalled)
    }
    
    func testUpdateListFollowers() {
        let viewController = build()
        viewController.interactor.updateListFollowers()
        XCTAssertTrue(viewController.setCalled)
    }
    
    func testAddFollowerInFavoriteList() {
        let viewController = build()
        viewController.interactor.addFollowerInFavoriteList()
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.dismissLoadingCalled)
    }
    
    func testAddFollowerInFavoriteListFailed() {
        self.userWorker = UserWorkerFailedMock()
        let viewController = build()
        viewController.interactor.addFollowerInFavoriteList()
        XCTAssertTrue(viewController.showAlertCalled)
    }
    // MARK: - Private Functions
    
    private func build(file: StaticString = #filePath, line: UInt = #line) -> FollowerListViewControllerMock {
        let interactor = FollowerListInteractor(
            followerWorker: followerWorker,
            userWorker: userWorker,
            persistenceWorker: persistenceWorker)
        
        let presenter = FollowerListPresenter()
        let viewController = FollowerListViewControllerMock()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        interactor.username = "brudrago"
        
        checkMemoryLeaks(for: viewController,file: file, line: line)
        
        return viewController
    }
}
