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
    public let youtube: String?
    public let articleURL: URL?
    public let wikipediaURL: URL?
    public let webcastURL: URL?
}

// MARK: - Coding Keys
private extension LaunchLinks {
    enum CodingKeys: String, CodingKey {
        case patch
        case pressKitURL = "presskit"
        case youtube = "youtube_id"
        case articleURL = "article"
        case wikipediaURL = "wikipedia"
        case reddit
        
        enum redditLinks: String, CodingKey {
            case redditCampaignURL = "campaign"
        }
        
        case webcastURL = "webcast"
    }
}

// MARK: - Decodable Conformance
extension LaunchLinks: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LaunchLinks.CodingKeys.self)
        
        patch = try container.decode(LaunchPatch.self, forKey: .patch)
        pressKitURL = try container.decodeURLIfPresent(keyedBy: .pressKitURL)
        
        youtube = try container.decodeIfPresent(String.self, forKey: .youtube)
        webcastURL = try container.decodeURLIfPresent(keyedBy: .webcastURL)
        articleURL = try container.decodeURLIfPresent(keyedBy: .articleURL)
        wikipediaURL = try container.decodeURLIfPresent(keyedBy: .wikipediaURL)
        
        let redditContainer = try container.nestedContainer(keyedBy: LaunchLinks.CodingKeys.redditLinks.self, forKey: .reddit)
        redditCampaignURL = try redditContainer.decodeURLIfPresent(keyedBy: .redditCampaignURL)
    }
}
