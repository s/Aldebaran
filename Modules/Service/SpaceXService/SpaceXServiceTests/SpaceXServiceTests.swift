//
//  SpaceXServiceTests.swift
//  SpaceXServiceTests
//
//  Created by Said Özcan on 06/01/2022.
//

import XCTest
import Combine
import SpaceXDataModels
@testable import SpaceXService

class SpaceXServiceTests: XCTestCase {
    // MARK: -
    private var disposeBag: [AnyCancellable] = []
    private let loader = MockDataLoader()

    // MARK: -
    func testUpcomingLaunches() throws {
        let service = SpaceXServiceStub(loader: loader)
        let expectation = XCTestExpectation()
        service.loadUpcomingLaunch().sink(receiveCompletion: { completion in
            expectation.fulfill()
        }, receiveValue: { response in
            XCTAssertTrue(!response.launches.isEmpty)
            XCTAssertEqual(response.limit, 1)

            let upcomingLaunch = response.launches[0]
            XCTAssertNotNil(upcomingLaunch)
            XCTAssertEqual(upcomingLaunch.name, "Transporter-3")
            XCTAssertEqual(upcomingLaunch.rocket.id, "5e9d0d95eda69973a809d1ec")
            XCTAssertEqual(upcomingLaunch.rocket.name, "Falcon 9")
            XCTAssertEqual(upcomingLaunch.flightNumber, 145)
            XCTAssertEqual(upcomingLaunch.dateUtc, Date(timeIntervalSince1970: 1642087500))
            XCTAssertEqual(upcomingLaunch.id, "61bf3e31cd5ab50b0d936345")
            expectation.fulfill()
        }).store(in: &disposeBag)
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
