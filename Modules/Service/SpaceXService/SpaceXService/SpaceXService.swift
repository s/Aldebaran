import Combine
import Foundation
import Networking
import SpaceXDataModels

// MARK: -
public protocol SpaceXLoader {
    func loadUpcomingLaunch() -> AnyPublisher<LaunchQueryResponse, Error>
    func loadPreviousLaunch() -> AnyPublisher<LaunchQueryResponse, Error>
    func loadLaunches() -> AnyPublisher<LaunchQueryResponse, Error>
}

// MARK: -
public struct SpaceXService: SpaceXLoader {
    // MARK: -
    private let urlSession = URLSession.shared
    
    // MARK: -
    public func loadUpcomingLaunch() -> AnyPublisher<LaunchQueryResponse, Error> {
        do {
            return try urlSession.publisher(for: .query, using: LaunchQueryRequestParameters.upcomingLaunch.encodeForRequest())
        } catch {
            print(error)
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    public func loadPreviousLaunch() -> AnyPublisher<LaunchQueryResponse, Error> {
        do {
            return try urlSession.publisher(for: .query, using: LaunchQueryRequestParameters.previousLaunch.encodeForRequest())
        } catch {
            print(error)
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    public func loadLaunches() -> AnyPublisher<LaunchQueryResponse, Error> {
        do {
            return try urlSession.publisher(for: .query, using: LaunchQueryRequestParameters.launches.encodeForRequest())
        } catch {
            print(error)
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
