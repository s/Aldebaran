//
//  LaunchQueryRequestParameters.swift
//  SpaceXService
//
//  Created by Muhammed Said Özcan on 08/01/2022.
//

import Foundation

// MARK: -
struct LaunchQueryRequestParameters: Encodable {
    // MARK: -
    enum SortingOptions: String {
        case ascending = "asc"
        case descending = "desc"
    }
    
    // MARK: -
    struct SortBy {
        let key: String
        let sorting: SortingOptions
    }
    
    // MARK: -
    struct Options: Encodable {
        // MARK: -
        let populate: [String]
        let sort: SortBy
        let limit: Int?
        
        // MARK: -
        init(populate: [String], sort: SortBy, limit: Int? = nil) {
            self.populate = populate
            self.sort = sort
            self.limit = limit
        }
        
        // MARK: -
        enum CodingKeys: String, CodingKey {
            case populate
            case sort
            case limit
        }
        
        // MARK: -
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: Options.CodingKeys.self)
            
            let populateArr = populate.map { ["path": $0] }
            try container.encode(populateArr, forKey: .populate)
            
            let sortDict = [sort.key: sort.sorting.rawValue]
            try container.encode(sortDict, forKey: .sort)
            
            if let limit = limit {
                try container.encode(limit, forKey: .limit)
            }
        }
    }
    
    // MARK: -
    struct Query: Encodable {
        // MARK: -
        let isUpcoming: Bool
        
        // MARK: -
        enum CodingKeys: String, CodingKey {
            case isUpcoming = "upcoming"
        }
        
        // MARK: -
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: Query.CodingKeys.self)
            try container.encode(isUpcoming, forKey: .isUpcoming)
        }
    }
    
    // MARK: -
    private let options: Options
    private let query: Query?
    
    // MARK: -
    enum CodingKeys: String, CodingKey {
        case options
        case query
    }
    
    // MARK: -
    init(options: Options, query: Query? = nil) {
        self.options = options
        self.query = query
    }
    
    // MARK: -
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: LaunchQueryRequestParameters.CodingKeys.self)
        try container.encode(options, forKey: .options)
        
        if let query = query {
            try container.encode(query, forKey: .query)
        }
    }
}
