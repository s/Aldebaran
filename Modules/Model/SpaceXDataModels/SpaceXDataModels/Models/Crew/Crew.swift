//
//  Crew.swift
//  SpaceXDataModels
//
//  Created by Said Özcan on 11/01/2022.
//

import Foundation

// MARK: -
public struct Crew: Equatable {
    let crewID: String
    let role: String
}

// MARK: - CodingKeys
private extension Crew {
    enum CodingKeys: String, CodingKey {
        case crewID = "crew"
        case role
    }
}

// MARK: - Decodable Conformance
extension Crew: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Crew.CodingKeys.self)
        
        crewID = try container.decode(String.self, forKey: .crewID)
        role = try container.decode(String.self, forKey: .role)
    }
}
