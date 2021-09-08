//
//  FollowerListSnapshotTests.swift
//  FollowersViewCodeSnapshotTests
//
//  Created by Bruna Drago on 08/09/21.
//

import XCTest
@testable import FollowersViewCode
import SnapshotTesting

class FollowerListViewControllerSnapshotTests: XCTestCase {
    
    func testFollowerListViewControllerDefaultState() {
        let viewController = FollowerListBuilder.build("brudrago")
        
        
        let result = verifySnapshot(matching: viewController,
                                    as: .image(on: .iPhoneX),
                                    named: "Default",
                                    record: false,
                                    testName: "FollowerListViewController")
        XCTAssertNil(result)
    }
}
