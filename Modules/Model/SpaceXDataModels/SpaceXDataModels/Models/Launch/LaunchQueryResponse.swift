//
//  LaunchQueryResponse.swift
//  SpaceXDataModels
//
//  Created by Muhammed Said Özcan on 08/01/2022.
//

import Foundation

// MARK: -
struct LaunchQueryResponse {
    let launches: [Launch]
    let totalNumberOfLaunches: Int
    let offset: Int
    let limit: Int
    let totalNumberOfPages: Int
    let currentPageNumber: Int
    let pagingCounter: Int
    let hasPreviousPage: Bool
    let hasNextPage: Bool
    let previousPageNumber: Int
    let nextPageNumber: Int
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
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LaunchQueryResponse.CodingKeys.self)
        
        launches = try container.decode([Launch].self, forKey: .launches)
        totalNumberOfLaunches = try container.decode(Int.self, forKey: .totalNumberOfLaunches)
        offset = try container.decode(Int.self, forKey: .offset)
        limit = try container.decode(Int.self, forKey: .limit)
        totalNumberOfPages = try container.decode(Int.self, forKey: .totalNumberOfPages)
        currentPageNumber = try container.decode(Int.self, forKey: .currentPageNumber)
        pagingCounter = try container.decode(Int.self, forKey: .pagingCounter)
        hasPreviousPage = try container.decode(Bool.self, forKey: .hasPreviousPage)
        hasNextPage = try container.decode(Bool.self, forKey: .hasNextPage)
        previousPageNumber = try container.decode(Int.self, forKey: .previousPageNumber)
        nextPageNumber = try container.decode(Int.self, forKey: .nextPageNumber)
    }
}
