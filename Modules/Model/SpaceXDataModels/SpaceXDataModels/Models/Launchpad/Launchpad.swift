//
//  Launchpad.swift
//  SpaceXDataModels
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation

// MARK: -
public struct Launchpad: Codable {
    public let name: String
    public let fullName: String
    public let locality: String
    public let region: String
    public let timezone: String
    public let latitude: Double
    public let longitude: Double
}
