//
//  Rocket.swift
//  SpaceXDataModels
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation
import Utils

// MARK: -
public struct Rocket {
    public let id: String
    public let name: String
    public let description: String?
    public let country: String
    public let company: String
    public let isActive: Bool
    public let wikipediaURL: URL?
    public let flickrImageURLs: [URL]?
}

// MARK: -
private extension Rocket {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case country
        case company
        case isActive = "active"
        case wikipediaURL = "wikipedia"
        case flickrimageURLs = "flickr_images"
    }
}

// MARK: -
extension Rocket: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Rocket.CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        country = try container.decode(String.self, forKey: .country)
        company = try container.decode(String.self, forKey: .company)
        isActive = try container.decode(Bool.self, forKey: .isActive)
        wikipediaURL = try container.decodeURL(keyedBy: .wikipediaURL)
        
        if let flickrImages = try container.decodeIfPresent([String].self, forKey: .flickrimageURLs) {
            flickrImageURLs = flickrImages.compactMap { URL(string:$0) }
        } else {
            flickrImageURLs = nil
        }
    }
}
