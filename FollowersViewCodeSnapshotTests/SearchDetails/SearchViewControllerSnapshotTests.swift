//
//  SearchViewControllerSnapshotTests.swift
//  FollowersViewCodeSnapshotTests
//
//  Created by Bruna Drago on 08/09/21.
//

import XCTest
@testable import FollowersViewCode
import SnapshotTesting

class SearchViewControllerSnapshotTests: XCTestCase {

    func testSearchViewControllerDefaultState() {
        let viewController = SearchViewController()
     
        let result = verifySnapshot(matching: viewController,
                                    as: .image(on: .iPhoneX),
                                    named: "Default",
                                    record: false,
                                    testName: "SearchViewController")
        XCTAssertNil(result)
    }
}
