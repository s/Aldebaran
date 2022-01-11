//
//  SpaceXServiceStub.swift
//  SpaceXService
//
//  Created by Said Özcan on 09/01/2022.
//
import Combine
import Foundation
import SpaceXDataModels
import Networking

// MARK: -
enum SpaceXServiceStubError: Error {
    case cannotBuildSampleResponse
}

// MARK: -
struct SpaceXServiceStub: SpaceXLoader {
    // MARK: -
    private let loader: MockDataLoader
    
    // MARK: -
    init(loader: MockDataLoader) {
        self.loader = loader
    }
    
    // MARK: -
    func loadUpcomingLaunch() -> AnyPublisher<LaunchQueryResponse, Error> {
        Just(loader.upcomingLaunchData())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func loadPreviousLaunch() -> AnyPublisher<LaunchQueryResponse, Error> {
        Just(loader.previousLaunchData())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func loadLaunches() -> AnyPublisher<LaunchQueryResponse, Error> {
        Just(loader.launchesData())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func loadLaunches(page: Int) -> AnyPublisher<LaunchQueryResponse, Error> {
        // TODO: implement next page stub
        Just(loader.launchesData())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    // MARK: -
    private func buildSampleResponse() -> HTTPURLResponse? {
        do {
            let request = try Endpoint.query.makeRequest(with: LaunchQueryRequestParameters.launches.encodeForRequest())
            guard let url = request?.url else { return nil }
            return HTTPURLResponse(url: url, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        } catch {
            print(error)
            preconditionFailure(error.localizedDescription)
        }
    }
}
