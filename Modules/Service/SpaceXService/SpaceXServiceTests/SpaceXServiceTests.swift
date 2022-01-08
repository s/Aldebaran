//
//  SpaceXServiceTests.swift
//  SpaceXServiceTests
//
//  Created by Said Özcan on 06/01/2022.
//

import XCTest
import Combine
@testable import SpaceXService

class SpaceXServiceTests: XCTestCase {
    // MARK: -
    private var disposeBag: [AnyCancellable] = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let service = SpaceXService()
        let expectation = XCTestExpectation()
        _ = service.loadPreviousLaunch().sink(receiveCompletion: { completion in
            print(completion)
            expectation.fulfill()
        }, receiveValue: { response in
            print(response)
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
