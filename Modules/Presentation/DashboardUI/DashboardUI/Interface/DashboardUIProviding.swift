//
//  DashboardUIProviding.swift
//  DashboardUI
//
//  Created by Said Özcan on 09/01/2022.
//

import SpaceXService

public protocol DashboardUIProviding {
    init(spaceXService:SpaceXService)
    func createUI() -> DashboardUIView
}
