//
//  LaunchesUIProviding.swift
//  LaunchesUI
//
//  Created by Said Özcan on 11/01/2022.
//

import Foundation
import SpaceXService

public protocol LaunchesUIProviding {
    init(spaceXService:SpaceXService)
    func createUI() -> LaunchesUIView
}
