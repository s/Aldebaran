//
//  Launch.swift
//  
//
//  Created by Said Özcan on 06/01/2022.
//

import Foundation
import Utils

// MARK: -
public struct Launch: Identifiable {
    public let id: String
    public let isUpcoming: Bool
    public let name: String
    public let details: String?
    public let flightNumber: Double

    public let launchpad: Launchpad
    public let rocket: Rocket
    public let payloadIDs: [String]
    public let crewIDs: [String]
    public let cores: [LaunchCore]?

    public let dateUtc: Date?
}

// MARK: - CodingKeys
private extension Launch {
    enum CodingKeys: String, CodingKey {
        case id
        case isUpcoming = "upcoming"
        case name
        case details
        case flightNumber
        case launchpad
        case rocket
        case payloadIDs = "payloads"
        case crewIDs = "crew"
        case cores
        case dateUtc
    }
}
// MARK: - Decodable Conformance
extension Launch: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Launch.CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        isUpcoming = try container.decode(Bool.self, forKey: .isUpcoming)
        name = try container.decode(String.self, forKey: .name)
        details = try container.decodeIfPresent(String.self, forKey: .details)
        flightNumber = try container.decode(Double.self, forKey: .flightNumber)
        launchpad = try container.decode(Launchpad.self, forKey: .launchpad)
        rocket = try container.decode(Rocket.self, forKey: .rocket)
        payloadIDs = try container.decode([String].self, forKey: .payloadIDs)
        crewIDs = try container.decode([String].self, forKey: .crewIDs)
        cores = try container.decodeIfPresent([LaunchCore].self, forKey: .cores)
        dateUtc = try container.decodeUTCDate(keyedBy: .dateUtc)
    }
}
