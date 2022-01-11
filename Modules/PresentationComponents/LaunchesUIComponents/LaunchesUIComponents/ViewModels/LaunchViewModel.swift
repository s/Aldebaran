//
//  LaunchViewModel.swift
//  DashboardUI
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation
import SwiftUI
import SpaceXDataModels
import MapKit

public final class LaunchViewModel: ObservableObject {
    // MARK: -
    let title: String?
    let launch: Launch
    let launchpadRegionCenter: CLLocationCoordinate2D
    let launchpadRegionSpan: MKCoordinateSpan
    let annotationItems: [LaunchpadMarker]
    var isUpcomingLaunch: Bool {
        if let date = launch.dateUtc {
            return date > Date()
        }
        return false
    }
    var hasPayloads: Bool {
        guard let payloads = launch.payloads else { return false }
        return !payloads.isEmpty
    }
    var payloads: [Payload] {
        launch.payloads ?? []
    }
    var youtubeVideoID: String? {
        launch.links?.webcastURL?.absoluteString.components(separatedBy: "/").last
    }
    var youtubeVideoThumbnailURL: URL? {
        guard let youtubeVideoID = youtubeVideoID else { return nil }
        return URL(string: "https://img.youtube.com/vi/\(youtubeVideoID)/0.jpg")
    }

    // MARK: -
    public init(title: String? = nil, launch: Launch) {
        self.title = title
        self.launch = launch
        self.launchpadRegionCenter = CLLocationCoordinate2D(latitude: launch.launchpad.latitude,
                                                            longitude: launch.launchpad.longitude)
        self.launchpadRegionSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        self.annotationItems = [LaunchpadMarker(coordinate: self.launchpadRegionCenter)]
    }
}
