//
//  Payload.swift
//  SpaceXDataModels
//
//  Created by Said Özcan on 10/01/2022.
//

import Foundation

public struct Payload: Codable {
    public let id: String
    public let name: String
    public let orbit: String
    public let referenceSystem: String
}
