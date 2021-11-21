//
//  SearchTests.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 01/08/21.
//

import XCTest
@testable import FollowersViewCode

class SearchTests: XCTestCase {

    // MARK: - Unit Tests
    
    func testInteractorInitialization() {
        let interactor = SearchInteractor()
        XCTAssertNotNil(interactor)
    }
    
    func testValidadeSucceed() {
        let username = "brudrago"
        let viewController = build()
        viewController.interactor.validate(username)
        
        XCTAssertNotNil(username)
        XCTAssertTrue(viewController.searchFollowersCalled)
        XCTAssertNotEqual(username, "bru")
    }
    
    func testValidadeFailed() {
        let viewController = build()
        viewController.interactor.validate("")
        XCTAssertTrue(viewController.showAlertCalled)
        
        viewController.interactor.validate("a")
        XCTAssertTrue(viewController.showAlertCalled)
    }
    
    // MARK: - Private Functions
    
    private func build(file: StaticString = #filePath, line: UInt = #line) -> SearchViewControllerMock {
        let interactor = SearchInteractor()
        
        let presenter = SearchPresenter()
        let viewController = SearchViewControllerMock()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        checkMemoryLeaks(for: viewController,file: file, line: line)
        
        return viewController
    }
}
