//
//  UserInfoSnapTests.swift
//  FollowersViewCodeSnapTests
//
//  Created by Bruna Fernanda Drago on 09/11/21.
//

import XCTest
@testable import FollowersViewCode
import SnapshotTesting

class UserInfoSnapTests: XCTestCase {
    
    // MARK: - Public Properties
    var userWorker: UserInfoWorkerProtocol!

    
    // MARK: - Test Lifecycle
    override func setUp() {
        self.userWorker = UserWorkerSnapMock()
    }

    func testUserInfoController() {
        let vc = build()
        
        assertSnapshot(matching: vc, as: .image, record: false)
    }
    
    // MARK: - Private Functions
    
    private func build() -> UserInfoViewController {
        let interactor = UserInfoInteractor(userInfoWorker: userWorker)

        let presenter = UserInfoPresenter()
        let viewController = UserInfoViewController()

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        interactor.follower = Follower(login: "bruDrago", avatarUrl: "")

        return viewController
    }
}
