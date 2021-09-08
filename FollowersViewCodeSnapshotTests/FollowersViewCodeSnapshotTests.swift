//
//  FollowersViewCodeSnapshotTests.swift
//  FollowersViewCodeSnapshotTests
//
//  Created by Bruna Drago on 08/09/21.
//

import XCTest
@testable import FollowersViewCode
import SnapshotTesting

class FollowersViewCodeSnapshotTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchViewController() throws {
        let vc = SearchViewController()
        assertSnapshot(matching: vc, as: .image)
    }

}
