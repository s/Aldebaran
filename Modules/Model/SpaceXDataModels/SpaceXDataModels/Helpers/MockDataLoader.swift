//
//  MockDataLoader.swift
//  SpaceXDataModels
//
//  Created by Muhammed Said Özcan on 09/01/2022.
//

import Foundation

private enum MockDataFileName: String {
    case upcomingLaunch = "upcoming_launch"
    case previousLaunch = "previous_launch"
    case launches = "launches"
}

public final class MockDataLoader {
    // MARK: -
    private let decoder: JSONDecoder = .init()
    
    // MARK: -
    public init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    // MARK: -
    public func upcomingLaunchData() -> LaunchQueryResponse {
        load(file: .upcomingLaunch)
    }
    
    public func previousLaunchData() -> LaunchQueryResponse {
        load(file: .previousLaunch)
    }
    
    public func launchesData() -> LaunchQueryResponse {
        load(file: .launches)
    }
    
    // MARK: -
    private func load(file fileName: MockDataFileName) -> LaunchQueryResponse {
        guard let url = bundleURL(forResource: fileName.rawValue) else {
            preconditionFailure("Cannot find \(fileName) JSON file in current Bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            return try decoder.decode(LaunchQueryResponse.self, from: data)
        } catch {
            print(error)
            preconditionFailure("Encountered an error while decoding: \(error.localizedDescription)")
        }
    }
    
    private func bundleURL(forResource resourceName: String) -> URL? {
        return Bundle(for: Self.self).url(forResource: resourceName, withExtension: "json")
    }
}
