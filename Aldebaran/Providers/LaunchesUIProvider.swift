//
//  LaunchesUIProvider.swift
//  Aldebaran
//
//  Created by Said Özcan on 11/01/2022.
//

import SwiftUI
import LaunchesUI
import SpaceXService
import PresentationSupport


struct LaunchesUITabBarItem: TabBarItem {
    // MARK: -
    private let launchesUIProvider: LaunchesUIProviding
    
    // MARK: -
    var image: Image {
        Image(systemName: "globe.europe.africa.fill")
    }
    
    var text: Text {
        Text("Launches")
    }
    
    var content: AnyView {
        AnyView(launchesUIProvider.createUI())
    }
    
    // MARK: -
    init(launchesUIProvider: LaunchesUIProviding) {
        self.launchesUIProvider = launchesUIProvider
    }
}

struct LaunchesUIProvider: LaunchesUIProviding {
    // MARK: -
    private let spaceXService: SpaceXService
    
    // MARK: -
    init(spaceXService:SpaceXService) {
        self.spaceXService = spaceXService
    }
    
    // MARK: -
    func createUI() -> LaunchesUIView {
        LaunchesUIView(viewModel: LaunchesUIViewModel(service: spaceXService))
    }
}
