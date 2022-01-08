//
//  LaunchPatch.swift
//  SpaceXService
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation
import Utils

// MARK: -
public struct LaunchPatch {
    public let small: URL?
    public let large: URL?
}

// MARK: -
private extension LaunchPatch {
    enum CodingKeys: String, CodingKey {
        case small
        case large
    }
}

// MARK: -
extension LaunchPatch: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LaunchPatch.CodingKeys.self)
        small = try container.decodeURL(keyedBy: .small)
        large = try container.decodeURL(keyedBy: .large)
    }
}

