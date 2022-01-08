//
//  KeyedDecodingContainer+DecodeURL.swift
//  SpaceXService
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation

public extension KeyedDecodingContainer  {
    func decodeURL(keyedBy: Key) throws -> URL? {
        let urlString = try decode(String.self, forKey: keyedBy)
        return URL(string: urlString)
    }
}
