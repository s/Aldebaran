import Combine
import Foundation
import Networking
import SpaceXDataModels

// MARK: -
public protocol SpaceXLoader {
    func loadPastLaunches() -> AnyPublisher<[Launch], Error>
    func loadUpcomingLaunch() -> AnyPublisher<Launch, Error>
}

// MARK: -
public struct SpaceXService: SpaceXLoader {
    // MARK: -
    private let urlSession = URLSession.shared
    
    // MARK: -
    public func loadPastLaunches() -> AnyPublisher<[Launch], Error> {
        urlSession.publisher(for: .pastLaunches, using: ())
    }
    
    public func loadUpcomingLaunch() -> AnyPublisher<Launch, Error> {
        urlSession.publisher(for: .nextLaunch, using: ())
    }
}
