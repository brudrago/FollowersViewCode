//
//  UserInfoTests.swift
//  FollowersViewCodeTests
//
//  Created by Bruna Drago on 07/09/21.
//

import XCTest
@testable import FollowersViewCode

class  UserInfoTests: XCTestCase {
    
    // MARK: - Public Properties
    
    var userWorker: UserInfoWorkerProtocol!
    
    // MARK: - Test Lifecycle
    
    override func setUp() {
        self.userWorker = UserWorkerMock()
    }
    
    // MARK: - Unit Tests

    func testInteractorInitialization() {
        let interactor = UserInfoInteractor()
        XCTAssertNotNil(interactor)
    }
    
    func testFetchUser() {
        guard let user = buildUser() else { return }
        let viewController = build(userMock: user)
        viewController.interactor.fetchUser()
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.dismissLoadingCalled)
        XCTAssertTrue(viewController.setCalled)
    }
    
    func testFetchUserFailed() {
        guard let user = buildEmptyUser() else { return }
        self.userWorker = UserWorkerFailedMock()
        let viewController = build(userMock: user)
        viewController.interactor.fetchUser()
        XCTAssertTrue(viewController.showAlertCalled)
    }
    
    func testShowUserProfile() {
        guard let user = buildUser() else { return }
        let viewController = build(userMock: user)
        viewController.interactor.showUserProfile()
        XCTAssertTrue(viewController.showUserCalled)
    }
    
    func testShowUserProfileFailed() {
        guard let user = buildEmptyUser() else { return }
        self.userWorker = UserWorkerFailedMock()
        let viewController = build(userMock: user)
        viewController.interactor.showUserProfile()
        XCTAssertTrue(viewController.showAlertCalled)
    }
    
    func testCheckForUserFollowers() {
        guard let user = buildUser() else { return }
        let viewController = build(userMock: user)
        viewController.interactor.checkForUserFollowers()
        XCTAssertFalse(viewController.showAlertCalled)
    }
    
    func testCheckForUserFollowersFailed() {
        guard let user = buildEmptyUser() else { return }
        self.userWorker = UserWorkerFailedMock()
        let viewController = build(userMock: user)
        viewController.interactor.checkForUserFollowers()
        XCTAssertTrue(viewController.showAlertCalled)
    }
    
    // MARK: - Private Functions
    
    private func build(userMock: User, file: StaticString = #filePath, line: UInt = #line) -> UserInfoViewControllerMock {
        let interactor = UserInfoInteractor(
            userInfoWorker: userWorker)
        
        let presenter = UserInfoPresenter()
        let viewController = UserInfoViewControllerMock()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        interactor.follower = Follower(login: "brudrago", avatarUrl: "")
        interactor.user = userMock
        
        checkMemoryLeaks(for: viewController, file: file, line: line)
        
        return viewController
    }
    
    private func buildUser() -> User? {
        return User(
            login: "brudrago", avatarUrl: "",
            name: "Bruna", location: "",
            bio: "", publicRepos: 1,
            publicGists: 1, followers: 1,
            following: 1, htmlUrl: "www.github.com",
            createdAt: Date())
    }
    
    private func buildEmptyUser() -> User? {
        return nil
    }
}
