//
//  DashboardUIProvider.swift
//  Aldebaran
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI
import DashboardUI
import SpaceXService
import PresentationSupport

struct DashboardUITabBarItem: TabBarItem {
    // MARK: -
    private let dashboardUIProvider: DashboardUIProvider
    
    // MARK: -
    var image: Image {
        Image(systemName: "puzzlepiece.fill")
    }
    
    var text: Text {
        Text("Dashboard")
    }
    
    var content: AnyView {
        AnyView(dashboardUIProvider.createUI())
    }
    
    // MARK: -
    init(dashboardUIProvider: DashboardUIProvider) {
        self.dashboardUIProvider = dashboardUIProvider
    }
}

struct DashboardUIProvider: DashboardUIProviding {
    // MARK: -
    private let spaceXService: SpaceXService
    
    // MARK: -
    init(spaceXService:SpaceXService) {
        self.spaceXService = spaceXService
    }
    
    // MARK: -
    func createUI() -> DashboardUIView {
        DashboardUIView(viewModel: DashboardUIViewModel(service: spaceXService))
    }
}
