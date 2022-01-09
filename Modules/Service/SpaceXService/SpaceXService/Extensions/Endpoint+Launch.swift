//
//  Endpoint+Launch.swift
//  
//
//  Created by Said Özcan on 06/01/2022.
//

import Foundation
import Networking
import SpaceXDataModels

extension Endpoint where Kind == EndpointKinds.POST, Response == LaunchQueryResponse {
    static var query: Self {
        Endpoint(api: API.spaceXAPI, path: "launches/query")
    }
}
