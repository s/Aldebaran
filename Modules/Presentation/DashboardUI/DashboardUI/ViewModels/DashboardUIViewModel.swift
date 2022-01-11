//
//  DashboardUIViewModel.swift
//  DashboardUI
//
//  Created by Said Özcan on 09/01/2022.
//

import Combine
import SwiftUI
import SpaceXService
import SpaceXDataModels
import PresentationSupport

public struct DashboardUIViewModelOutput {
    let previousLaunch: Launch?
    let upcomingLaunch: Launch?
    
    var hasNoData: Bool {
        (previousLaunch == nil) && (upcomingLaunch == nil)
    }
}

public final class DashboardUIViewModel: ObservableObject, LoadableObject {
    // MARK: -
    public typealias Output = DashboardUIViewModelOutput
    private let service: SpaceXLoader
    private var cancellable: AnyCancellable?
    
    @Published
    public private(set) var state = LoadingState<DashboardUIViewModelOutput>.idle
        
    // MARK: -
    public init(service: SpaceXService) {
        self.service = service
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    // MARK: -
    public func load() {
        state = .loading
        cancellable = Publishers.Zip(
            service.loadPreviousLaunch(),
            service.loadUpcomingLaunch()
        ).sink(receiveCompletion: { [weak self] completion in
            guard let self = self else { return }
            switch completion {
            case .finished: break
            case .failure(let error):
                self.state = .failed(error)
                debugPrint(error)
            }
        }, receiveValue: { [weak self] (previousLaunchResponse, upcomingLaunchResponse) in
            guard let self = self else { return }
            self.state = .loaded(DashboardUIViewModelOutput(previousLaunch: previousLaunchResponse.launches.first,
                                                            upcomingLaunch: upcomingLaunchResponse.launches.first))
        })
    }
}

