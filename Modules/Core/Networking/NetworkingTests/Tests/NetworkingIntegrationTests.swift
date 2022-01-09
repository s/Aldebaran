//
//  NetworkingIntegrationTests.swift
//  NetworkingTests
//
//  Created by Said Özcan on 06/01/2022.
//

import XCTest
@testable import Networking

class NetworkingIntegrationTests: XCTestCase {
    let api = API(baseURL: BaseURL(scheme: "https", host: "api.myapp.com"))
    typealias StubbedAuthenticatedEndpoint = Endpoint<EndpointKinds.Authenticated, MockModel>
    
    func testSuccessfullyPerformingRequest() throws {
        let session = URLSession(mockResponder: MockModel.MockDataURLResponder.self)
        let endpoint = StubbedAuthenticatedEndpoint(api: api, path: "paths")

        let publisher = session.publisher(for: endpoint, using: "12345")
        let result = try awaitCompletion(of: publisher)

        XCTAssertEqual(result, [MockModel.MockDataURLResponder.item])
    }

    func testFailingWhenEncounteringError() throws {
        let session = URLSession(mockResponder: MockErrorURLResponder.self)
        let endpoint = StubbedAuthenticatedEndpoint(api: api, path: "paths")
        let publisher = session.publisher(for: endpoint, using: "12345")
        XCTAssertThrowsError(try awaitCompletion(of: publisher))
    }
}
