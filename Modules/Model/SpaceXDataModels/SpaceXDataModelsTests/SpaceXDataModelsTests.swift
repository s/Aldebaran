//
//  SpaceXDataModelsTests.swift
//  SpaceXDataModelsTests
//
//  Created by Said Özcan on 08/01/2022.
//

import XCTest
@testable import SpaceXDataModels

class SpaceXDataModelsTests: XCTestCase {
    // MARK: -
    private var decoder: JSONDecoder?
    
    override func setUp() {
        decoder = JSONDecoder()
        decoder?.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    // MARK: -
    func testUpcomingLaunch() throws {
        guard let url = bundleURL(forResource: "upcoming_launch") else {
            XCTFail("Cannot find upcoming launch json file.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            guard let upcomingLaunchResponse = try decoder?.decode(LaunchQueryResponse.self, from: data) else {
                XCTFail("Found empty upcoming launch json file.")
                return
            }
            XCTAssertTrue(!upcomingLaunchResponse.launches.isEmpty)
            XCTAssertEqual(upcomingLaunchResponse.limit, 1)
            
            let upcomingLaunch = upcomingLaunchResponse.launches[0]
            XCTAssertNotNil(upcomingLaunch)
            XCTAssertEqual(upcomingLaunch.name, "Transporter-3")
            XCTAssertEqual(upcomingLaunch.rocket.id, "5e9d0d95eda69973a809d1ec")
            XCTAssertEqual(upcomingLaunch.rocket.name, "Falcon 9")
            XCTAssertEqual(upcomingLaunch.flightNumber, 145)
            XCTAssertEqual(upcomingLaunch.dateUtc, Date(timeIntervalSince1970: 1642087500))
            XCTAssertEqual(upcomingLaunch.id, "61bf3e31cd5ab50b0d936345")
        } catch {
            print(error)
            XCTFail("Error thrown: \(error.localizedDescription)")
        }
    }
    
    func testPreviousLaunch() throws {
        guard let url = bundleURL(forResource: "previous_launch") else {
            XCTFail("Cannot find previous launch json file.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            guard let previousLaunchResponse = try decoder?.decode(LaunchQueryResponse.self, from: data) else {
                XCTFail("Found empty upcoming launch json file.")
                return
            }
            XCTAssertTrue(!previousLaunchResponse.launches.isEmpty)
            XCTAssertEqual(previousLaunchResponse.limit, 1)

            let previousLaunch = previousLaunchResponse.launches[0]
            XCTAssertNotNil(previousLaunch)
            XCTAssertEqual(previousLaunch.name, "Starlink 4-5 (v1.5)")
            XCTAssertEqual(previousLaunch.rocket.id, "5e9d0d95eda69973a809d1ec")
            XCTAssertEqual(previousLaunch.rocket.name, "Falcon 9")
            XCTAssertEqual(previousLaunch.flightNumber, 144)
            XCTAssertEqual(previousLaunch.dateUtc, Date(timeIntervalSince1970: 1641505740))
            XCTAssertEqual(previousLaunch.id, "61d5eca1f88e4c5fc91f1eb7")
        } catch {
            print(error)
            XCTFail("Error thrown: \(error.localizedDescription)")
        }
    }
    
    func testLaunches() throws {
        guard let url = bundleURL(forResource: "launches") else {
            XCTFail("Cannot find launches json file.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            guard let launches = try decoder?.decode(LaunchQueryResponse.self, from: data) else {
                XCTFail("Found empty upcoming launch json file.")
                return
            }
            XCTAssertTrue(!launches.launches.isEmpty)
            XCTAssertEqual(launches.limit, 10)
            XCTAssertNotNil(launches.nextPageNumber)
            XCTAssertEqual(launches.nextPageNumber, 2)

            let oneLaunch = launches.launches[7]
            XCTAssertNotNil(oneLaunch)
            XCTAssertEqual(oneLaunch.name, "Starlink 4-4 (v1.5)")
            XCTAssertEqual(oneLaunch.rocket.id, "5e9d0d95eda69973a809d1ec")
            XCTAssertEqual(oneLaunch.rocket.name, "Falcon 9")
            XCTAssertEqual(oneLaunch.flightNumber, 141)
            XCTAssertEqual(oneLaunch.dateUtc, Date(timeIntervalSince1970: 1639831300))
            XCTAssertEqual(oneLaunch.id, "61bba806437241381bf7061e")
        } catch {
            print(error)
            XCTFail("Error thrown: \(error.localizedDescription)")
        }
    }
    
    // MARK: -
    private func bundleURL(forResource resourceName: String) -> URL? {
        return Bundle(for: Self.self).url(forResource: resourceName, withExtension: "json")
    }
}
