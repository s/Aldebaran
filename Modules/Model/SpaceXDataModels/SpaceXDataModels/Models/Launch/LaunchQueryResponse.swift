//
//  LaunchQueryResponse.swift
//  SpaceXDataModels
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation

// MARK: -
public struct LaunchQueryResponse {
    public let launches: [Launch]
    public let totalNumberOfLaunches: Int
    public let offset: Int?
    public let limit: Int
    public let totalNumberOfPages: Int
    public let currentPageNumber: Int
    public let pagingCounter: Int
    public let hasPreviousPage: Bool
    public let hasNextPage: Bool
    public let previousPageNumber: Int?
    public let nextPageNumber: Int?
}

// MARK: -
private extension LaunchQueryResponse {
    enum CodingKeys: String, CodingKey {
        case launches = "docs"
        case totalNumberOfLaunches = "totalDocs"
        case offset
        case limit
        case totalNumberOfPages = "totalPages"
        case currentPageNumber = "page"
        case pagingCounter
        case hasPreviousPage = "hasPrevPage"
        case hasNextPage = "hasNextPage"
        case previousPageNumber = "prevPage"
        case nextPageNumber = "nextPage"
    }
}

// MARK: -
extension LaunchQueryResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LaunchQueryResponse.CodingKeys.self)
        
        launches = try container.decode([Launch].self, forKey: .launches)
        totalNumberOfLaunches = try container.decode(Int.self, forKey: .totalNumberOfLaunches)
        offset = try container.decodeIfPresent(Int.self, forKey: .offset)
        limit = try container.decode(Int.self, forKey: .limit)
        totalNumberOfPages = try container.decode(Int.self, forKey: .totalNumberOfPages)
        currentPageNumber = try container.decode(Int.self, forKey: .currentPageNumber)
        pagingCounter = try container.decode(Int.self, forKey: .pagingCounter)
        hasPreviousPage = try container.decode(Bool.self, forKey: .hasPreviousPage)
        hasNextPage = try container.decode(Bool.self, forKey: .hasNextPage)
        previousPageNumber = try container.decodeIfPresent(Int.self, forKey: .previousPageNumber)
        nextPageNumber = try container.decodeIfPresent(Int.self, forKey: .nextPageNumber)
    }
}
