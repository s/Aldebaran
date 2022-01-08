//
//  LaunchCore.swift
//  
//
//  Created by Said Özcan on 06/01/2022.
//

import Foundation

public struct LaunchCore: Codable {
    // MARK: -
    public let coreID: String?
    public let flight: Int?
    public let gridfins: Bool?
    public let legs: Bool?
    public let isReused: Bool?
    public let hasAttemptedToLand: Bool?
    public let hasSuccessfullyLanded: Bool?
    public let landingType: String?
    public let landpadID: String?
    
    // MARK: -
    enum CodingKeys: String, CodingKey {
        case coreID = "core"
        case flight
        case gridfins
        case legs
        case isReused = "reused"
        case hasAttemptedToLand = "landing_attempt"
        case hasSuccessfullyLanded = "landing_success"
        case landingType = "landing_type"
        case landpadID = "landpad"
    }
}
