//
//  EndpointTests.swift
//  NetworkingTests
//
//  Created by Said Özcan on 09/01/2022.
//

import XCTest
@testable import Networking

class EndpointTests: XCTestCase {
    typealias StubbedEndpoint = Endpoint<EndpointKinds.Stub, String>
    typealias StubbedAuthenticatedEndpoint = Endpoint<EndpointKinds.Authenticated, String>
    
    let api = API(baseURL: BaseURL(scheme: "https", host: "api.myapp.com"))

    func testBasicRequestGeneration() {
        let endpoint = StubbedEndpoint(api: api, path: "path")
        do {
            let request = try XCTUnwrap(endpoint.makeRequest(with: ()))
            XCTAssertEqual(request.url, URL(string: "https://api.myapp.com/path"))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testGeneratingRequestWithQueryItems() throws {
        let endpoint = StubbedEndpoint(api: api, path: "path", queryItems: [
            URLQueryItem(name: "a", value: "1"),
            URLQueryItem(name: "b", value: "2")
        ])

        let request = endpoint.makeRequest(with: ())

        try XCTAssertEqual(
            request?.url,
            api.expectedURL(withPath: "path?a=1&b=2")
        )
    }
    
    func testAddingAccessTokenToPrivateEndpoint() throws {
        let endpoint = StubbedAuthenticatedEndpoint(api: api, path: "path")
        let request = endpoint.makeRequest(with: "12345")

        try XCTAssertEqual(
            request?.url,
            api.expectedURL(withPath: "path")
        )

        XCTAssertEqual(request?.allHTTPHeaderFields, [
            "Authorization": "Bearer 12345"
        ])
    }
}
