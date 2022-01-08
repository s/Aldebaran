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
    func testNextLaunch() throws {
        guard let url = bundleURL(forResource: "next_launch") else {
            XCTFail("Cannot find next launch json file")
            return
        }
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let nextLaunch = try JSONDecoder().decode(Launch.self, from: data)
            XCTAssertNotNil(nextLaunch)
            XCTAssertEqual(nextLaunch.name, "Transporter-3")
            XCTAssertEqual(nextLaunch.rocketID, "5e9d0d95eda69973a809d1ec")
            XCTAssertEqual(nextLaunch.launchpadID, "5e9e4501f509094ba4566f84")
            XCTAssertEqual(nextLaunch.flightNumber, 145)
            XCTAssertEqual(nextLaunch.dateUTC, Date(timeIntervalSince1970: 1642087500))
            XCTAssertEqual(nextLaunch.id, "61bf3e31cd5ab50b0d936345")
            XCTAssertNil(nextLaunch.staticFireDateUTC)
        } catch {
            XCTFail("Error thrown: \(error.localizedDescription)")
        }
    }

    func testPastLaunches() throws {
        guard let url = bundleURL(forResource: "past_launches") else {
            XCTFail("Cannot find next launch json file")
            return
        }
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let pastLaunches = try JSONDecoder().decode([Launch].self, from: data)
            XCTAssertNotNil(pastLaunches)
            XCTAssertTrue(!pastLaunches.isEmpty)
            XCTAssertTrue(pastLaunches.count == 3)
            
            let first = pastLaunches[0]
            XCTAssertEqual(first.name, "FalconSat")
            XCTAssertEqual(first.flightNumber, 1)
        } catch {
            XCTFail("Error thrown: \(error.localizedDescription)")
        }
    }
    
    // MARK: -
    private func bundleURL(forResource resourceName: String) -> URL? {
        return Bundle(for: Self.self).url(forResource: resourceName, withExtension: "json")
    }
}
