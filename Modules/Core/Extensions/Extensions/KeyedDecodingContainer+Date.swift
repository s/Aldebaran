//
//  KeyedDecodingContainer+Date.swift
//  SpaceXService
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation

public extension KeyedDecodingContainer  {
    func decodeUTCDate(keyedBy: Key) throws -> Date {
        let dateString = try decode(String.self, forKey: keyedBy)
        guard let date = DateFormatter.iso8601Full.date(from: dateString) else {
            let debugDescription = "Event: Date string does not match format expected by formatter."
            throw DecodingError.dataCorruptedError(forKey: keyedBy,
                                                   in: self,
                                                   debugDescription: debugDescription)
        }
        return date
    }
}
