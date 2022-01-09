//
//  LaunchViewTests.swift
//  DashboardUITests
//
//  Created by Said Özcan on 09/01/2022.
//

import XCTest
import SpaceXDataModels
@testable import DashboardUI
import SnapshotTesting

class LaunchViewTests: XCTestCase {
    // MARK: -
    let loader = MockDataLoader()
    
    // MARK: -
    func testLaunchView() {
        let upcomingLaunch = loader.upcomingLaunchData()
        let viewModel = LaunchViewModel(launch: upcomingLaunch)
        let view = LaunchView(launchViewModel: viewModel)
        assertSnapshot(matching: view, as: .image)
    }
}

