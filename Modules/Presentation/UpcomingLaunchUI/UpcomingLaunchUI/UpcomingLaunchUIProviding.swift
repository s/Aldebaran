//
//  UpcomingLaunchUIProviding.swift
//  UpcomingLaunchUI
//
//  Created by Muhammed Said Özcan on 09/01/2022.
//

import SwiftUI
import SpaceXService

public protocol UpcomingLaunchUIProviding {
    func createUI(with service:SpaceXService) -> UpcomingLaunchView
}
