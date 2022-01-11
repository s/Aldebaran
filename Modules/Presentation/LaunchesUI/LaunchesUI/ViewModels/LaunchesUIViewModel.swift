//
//  LaunchesViewModel.swift
//  LaunchesUI
//
//  Created by Said Özcan on 11/01/2022.
//

import SwiftUI
import SpaceXDataModels
import PresentationSupport
import SpaceXService
import Combine

public final class LaunchesUIViewModel: ObservableObject, LoadableObject {
    // MARK: -
    private let service: SpaceXLoader
    private var cancellable: AnyCancellable?
    private var response: LaunchQueryResponse?
    private var launches: [Launch] = []
    var hasNextPage: Bool {
        response?.hasNextPage ?? false
    }
    var isPopulated: Bool {
        // TODO: Check loading state instead
        response != nil
    }
    
    @Published
    public private(set) var state = LoadingState<[Launch]>.idle
    
    // MARK: -
    public init(service: SpaceXService) {
        self.service = service
    }
    
    // MARK: -
    public func load() {
        state = .loading
        cancellable = service.loadLaunches().sink(receiveCompletion: { [weak self] completion in
            guard let self = self else { return }
            switch completion {
            case .finished: break
            case .failure(let error):
                self.state = .failed(error)
                debugPrint(error)
            }
        }, receiveValue: { [weak self] pastLaunchesResponse in
            guard let self = self else { return }
            self.response = pastLaunchesResponse
            self.launches = pastLaunchesResponse.launches
            self.state = .loaded(pastLaunchesResponse.launches)
        })
    }
    
    func loadNextPage() {
        
    }
}
