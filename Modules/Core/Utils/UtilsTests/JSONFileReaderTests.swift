//
//  JSONFileReaderTests.swift
//  UtilsTests
//
//  Created by Muhammed Said Özcan on 08/01/2022.
//

import XCTest
@testable import Utils

class JSONFileReaderTests: XCTestCase {

    func testSampleUsers() throws {
        let reader = JSONFileReader()
        let usersResponse: SampleUserListResponse = reader.read(from: "sample_users", in: Bundle(for: Self.self))
        
    }
}
