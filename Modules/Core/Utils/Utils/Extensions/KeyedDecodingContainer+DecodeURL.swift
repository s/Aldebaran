//
//  KeyedDecodingContainer+DecodeURL.swift
//  SpaceXService
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation

public extension KeyedDecodingContainer  {
    func decodeURLIfPresent(keyedBy: Key) throws -> URL? {
        guard let urlString = try decodeIfPresent(String.self, forKey: keyedBy) else {
            return nil
        }
        return URL(string: urlString)
    }

    func decodeURL(keyedBy: Key) throws -> URL? {
        let urlString = try decode(String.self, forKey: keyedBy)
        return URL(string: urlString)
    }
}
