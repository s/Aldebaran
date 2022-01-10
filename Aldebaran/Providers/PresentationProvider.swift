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

struct LaunchesTabBarItem: TabBarItem {
    var image: Image {
        Image(systemName: "globe.europe.africa.fill")
    }
    
    var text: Text {
        Text("Launches")
    }
    
    var content: AnyView {
        AnyView(Text("launches"))
    }
}

struct PresentationProvider {
    
    // MARK: -
    static let spaceXService = SpaceXService()
    let dashboardUIProvider = DashboardUIProvider(spaceXService: Self.spaceXService)
    let tabBarItems: [TabBarItem]
    
    // MARK: -
    init() {
        self.tabBarItems = [
            DashboardUITabBarItem(dashboardUIProvider: dashboardUIProvider),
            LaunchesTabBarItem()
        ]
    }
}
