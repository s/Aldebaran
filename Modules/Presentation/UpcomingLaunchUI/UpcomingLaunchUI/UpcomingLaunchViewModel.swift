//
//  UpcomingLaunchViewModel.swift
//  UpcomingLaunchUI
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI
import SpaceXService

public final class UpcomingLaunchViewModel: ObservableObject {
    // MARK: -
    private let service: SpaceXService
    
    // MARK: -
    public init(service: SpaceXService) {
        self.service = service
    }
}
