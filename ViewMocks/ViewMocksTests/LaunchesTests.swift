//
//  LaunchesTests.swift
//  ViewMocksTests
//
//  Created by Maciek on 08/06/2020.
//  Copyright © 2020 Maciek. All rights reserved.
//

import XCTest
import SnapshotTesting
import ViewMocks
import View

class LaunchesTests: XCTestCase {
    func testLaunches() {
        let vc = LaunchesBuilder.buildMockedViewController()

        assertSnapshot(matching: vc, as: .image(on: .iPadMini))
    }
}
