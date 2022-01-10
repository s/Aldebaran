//
//  LaunchQueryRequestParameters+UseCases.swift
//  SpaceXService
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation

extension LaunchQueryRequestParameters {
    static var upcomingLaunch: LaunchQueryRequestParameters {
        LaunchQueryRequestParameters(
            options: .init(populate: ["rocket", "launchpad", "payloads"],
                           sort: .init(key: "flight_number", sorting: .ascending),
                           limit: 1),
            query: .init(isUpcoming: true)
        )
    }
    
    static var previousLaunch: LaunchQueryRequestParameters {
        LaunchQueryRequestParameters(
            options: .init(populate: ["rocket", "launchpad", "payloads"],
                           sort: .init(key: "flight_number", sorting: .descending),
                           limit: 1),
            query: .init(isUpcoming: false)
        )
    }
    
    static var launches: LaunchQueryRequestParameters {
        LaunchQueryRequestParameters(
            options: .init(populate: ["rocket", "launchpad", "payloads"],
                           sort: .init(key: "flight_number", sorting: .descending)),
            query: .init(isUpcoming: true)
        )
    }
}
