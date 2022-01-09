//
//  DashboardUIProvider.swift
//  Aldebaran
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation
import DashboardUI
import SpaceXService

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
