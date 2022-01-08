//
//  LaunchLinks.swift
//  
//
//  Created by Said Özcan on 06/01/2022.
//

import Foundation

// MARK: -
public struct LaunchLinks {
    public let patch: LaunchPatch
    public let redditCampaignURL: URL?
    public let pressKitURL: URL?
    public let youtubeURL: URL?
    public let articleURL: URL?
    public let wikipediaURL: URL?
}

// MARK: - Coding Keys
private extension LaunchLinks {
    enum CodingKeys: String, CodingKey {
        case patch
        case pressKitURL = "presskit"
        case youtubeURL = "youtube_id"
        case articleURL = "article"
        case wikipediaURL = "wikipedia"
        case reddit
        
        enum redditLinks: String, CodingKey {
            case redditCampaignURL = "campaign"
        }
    }
}

// MARK: - Decodable Conformance
extension LaunchLinks: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LaunchLinks.CodingKeys.self)
        
        patch = try container.decode(LaunchPatch.self, forKey: .patch)
        pressKitURL = try container.decodeURL(keyedBy: .pressKitURL)
        
        let youtubeID = try container.decode(String.self, forKey: .youtubeURL)
        if !youtubeID.isEmpty {
            youtubeURL = URL(string: "https://www.youtube.com/watch?\(youtubeID)")
        } else {
            youtubeURL = nil
        }
        articleURL = try container.decodeURL(keyedBy: .articleURL)
        wikipediaURL = try container.decodeURL(keyedBy: .wikipediaURL)
        
        let redditContainer = try container.nestedContainer(keyedBy: LaunchLinks.CodingKeys.redditLinks.self, forKey: .reddit)
        redditCampaignURL = try redditContainer.decodeURL(keyedBy: .redditCampaignURL)
    }
}
