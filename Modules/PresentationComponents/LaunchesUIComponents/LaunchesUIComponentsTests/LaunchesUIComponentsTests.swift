//
//  LaunchesUIComponentsTests.swift
//  LaunchesUIComponentsTests
//
//  Created by Said Özcan on 11/01/2022.
//

import XCTest
import SwiftUI
import SpaceXDataModels
@testable import LaunchesUIComponents
import SnapshotTesting

class LaunchesUIComponentsTests: XCTestCase {
    // MARK: -
    private static let windowWidth: CGFloat = 320.0
    
    // MARK: -
    override class func setUp() {
        isRecording = true
    }
    
    // MARK: -
    func testPreviousLaunch() {
        guard let model = MockDataLoader().previousLaunchData().launches.first else {
            XCTFail("Cannot load previous launch mock data.")
            return
        }
        let viewModel = LaunchViewModel(launch: model)
        let view = LaunchView(viewModel: viewModel)
        runTest(for: AnyView(view), testName: "PreviousLaunchView")
    }
    
    func testUpcomingLaunch() {
        guard let model = MockDataLoader().upcomingLaunchData().launches.first else {
            XCTFail("Cannot load upcoming launch mock data.")
            return
        }
        let viewModel = LaunchViewModel(launch: model)
        let view = LaunchView(viewModel: viewModel)
        runTest(for: AnyView(view), testName: "UpcomingLaunchView")
    }
    
    // MARK: -
    private func runTest(for view: AnyView, testName: String) {
        let hostingViewController = UIHostingController(rootView: view)
        let viewSize = hostingViewController.view.sizeThatFits(
            CGSize(width: Self.windowWidth, height: UIScreen.main.bounds.height)
        )
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: Self.windowWidth, height: viewSize.height))
        window.rootViewController = hostingViewController
        window.makeKeyAndVisible()
        
        guard let viewToTest = window.rootViewController?.view else {
            XCTFail("Cannot get view from root controller.")
            return
        }
        let size = viewToTest.intrinsicContentSize
        assertSnapshot(matching: viewToTest, as: .image(size: size), testName: testName)
    }
}
