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

    public let launchpadID: String
    public let rocketID: String
    public let payloadIDs: [String]
    public let crewIDs: [String]
    public let cores: [LaunchCore]?

    public let dateUTC: Date?
    public let staticFireDateUTC: Date?
}

// MARK: - CodingKeys
private extension Launch {
    enum CodingKeys: String, CodingKey {
        case id
        case isUpcoming = "upcoming"
        case name
        case details
        case flightNumber = "flight_number"
        case launchpadID = "launchpad"
        case rocketID = "rocket"
        case payloadIDs = "payloads"
        case crewIDs = "crew"
        case cores
        case dateUTC = "date_utc"
        case staticFireDateUTC = "static_fire_date_utc"
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
        launchpadID = try container.decode(String.self, forKey: .launchpadID)
        rocketID = try container.decode(String.self, forKey: .rocketID)
        payloadIDs = try container.decode([String].self, forKey: .payloadIDs)
        crewIDs = try container.decode([String].self, forKey: .crewIDs)
        cores = try container.decodeIfPresent([LaunchCore].self, forKey: .cores)
        dateUTC = try container.decodeUTCDate(keyedBy: .dateUTC)
        staticFireDateUTC = try container.decodeUTCDateIfPresent(keyedBy: .staticFireDateUTC)
    }
}
