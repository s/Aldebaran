//
//  PresentationProvider.swift
//  Aldebaran
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation
import DashboardUI
import SwiftUI
import SpaceXService
import PresentationSupport

struct PresentationProvider {
    
    // MARK: -
    static let spaceXService = SpaceXService()
    let dashboardUIProvider = DashboardUIProvider(spaceXService: Self.spaceXService)
    let launchesUIProvider = LaunchesUIProvider(spaceXService: Self.spaceXService)
    let tabBarItems: [TabBarItem]
    
    // MARK: -
    init() {
        self.tabBarItems = [
            DashboardUITabBarItem(dashboardUIProvider: dashboardUIProvider),
            LaunchesUITabBarItem(launchesUIProvider: launchesUIProvider)
        ]
    }
}
