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

struct PresentationProvider {
    static let spaceXService = SpaceXService()
    let dashboardUIProvider = DashboardUIProvider(spaceXService: Self.spaceXService)
}
