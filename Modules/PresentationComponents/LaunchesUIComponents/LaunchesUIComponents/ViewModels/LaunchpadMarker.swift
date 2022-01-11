//
//  LaunchpadMarker.swift
//  DashboardUI
//
//  Created by Said Özcan on 10/01/2022.
//

import Foundation
import CoreLocation

struct LaunchpadMarker: Identifiable {
    // MARK: -
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    // MARK: -
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
