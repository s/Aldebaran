//
//  Extension+Launch.swift
//  
//
//  Created by Said Özcan on 06/01/2022.
//

import Foundation
import Networking
import SpaceXDataModels

extension Endpoint where Kind == EndpointKinds.Public, Response == [Launch] {
    static var pastLaunches: Self {
        Endpoint(api: API.spaceXAPI, path: "launches/past")
    }
}

extension Endpoint where Kind == EndpointKinds.Public, Response == Launch {
    static var nextLaunch: Self {
        Endpoint(api: API.spaceXAPI, path: "launches/next")
    }
}
