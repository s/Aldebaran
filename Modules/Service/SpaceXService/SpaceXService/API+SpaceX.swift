//
//  API+SpaceX.swift
//  SpaceXService
//
//  Created by Said Özcan on 08/01/2022.
//

import Networking

extension API {
    static var spaceXAPI: API {
        API(baseURL: BaseURL(scheme: "https", host: "api.spacexdata.com"))
    }
}
