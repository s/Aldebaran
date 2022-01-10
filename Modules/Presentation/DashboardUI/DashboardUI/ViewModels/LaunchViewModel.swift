//
//  LaunchViewModel.swift
//  DashboardUI
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation
import SpaceXDataModels

final class LaunchViewModel: ObservableObject {
    // MARK: -
    let title: String
    let launch: Launch
    
    // MARK: -
    init(title: String, launch: Launch) {
        self.title = title
        self.launch = launch
    }
}
