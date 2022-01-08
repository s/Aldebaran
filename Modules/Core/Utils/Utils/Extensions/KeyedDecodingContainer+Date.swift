//
//  KeyedDecodingContainer+Date.swift
//  SpaceXService
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation

public extension KeyedDecodingContainer  {
    func decodeUTCDateIfPresent(keyedBy: Key) throws -> Date? {
        guard let dateString = try decodeIfPresent(String.self, forKey: keyedBy) else { return nil }
        return try _decodeUTCDate(keyedBy: keyedBy, from: dateString)
    }
    
    func decodeUTCDate(keyedBy: Key) throws -> Date {
        let dateString = try decode(String.self, forKey: keyedBy)
        return try _decodeUTCDate(keyedBy: keyedBy, from: dateString)
    }
    
    private func _decodeUTCDate(keyedBy: Key, from dateString: String) throws -> Date {
        guard let date = DateFormatter.iso8601Full.date(from: dateString) else {
            let debugDescription = "Date string does not match format expected by formatter."
            throw DecodingError.dataCorruptedError(forKey: keyedBy,
                                                   in: self,
                                                   debugDescription: debugDescription)
        }
        return date
    }
}
