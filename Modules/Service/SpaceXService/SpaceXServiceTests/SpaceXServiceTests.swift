//
//  SpaceXServiceTests.swift
//  SpaceXServiceTests
//
//  Created by Said Özcan on 06/01/2022.
//

import XCTest
@testable import SpaceXService

class SpaceXServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let service = SpaceXService()
        
        service.loadPastLaunches().sink { completion in
            print(completion)
        } receiveValue: { launches in
            print(launches)
        }

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
