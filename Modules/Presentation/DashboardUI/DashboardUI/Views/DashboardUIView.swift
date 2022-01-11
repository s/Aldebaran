//
//  DashboardUIView.swift
//  DashboardUI
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI
import PresentationSupport
import SpaceXDataModels
import LaunchesUI

public struct DashboardUIView: View {
    // MARK: -
    private let viewModel: DashboardUIViewModel
    
    // MARK: -
    public init(viewModel: DashboardUIViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: -
    public var body: some View {
        GeometryReader { geometry in
            AsyncContentView(source: viewModel) { launches in
                dashboardView(with: launches)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    // MARK: -
    @ViewBuilder
    private func dashboardView(with launches: DashboardUIViewModelOutput) -> some View {
        if launches.hasNoData {
            EmptyContentView()
        } else {
            VStack (alignment: .leading, spacing: Spacing.large.rawValue) {
                launchView(with: launches.upcomingLaunch, isUpcoming: true)
                launchView(with: launches.previousLaunch, isUpcoming: false)
                Spacer()
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private func launchView(with launch: Launch?, isUpcoming: Bool) -> some View {
        if let launch = launch {
            // TODO: Localize
            LaunchView(viewModel: LaunchViewModel(title: isUpcoming ? "Upcoming Launch" : "Previous Launch",
                                                  launch: launch))
        }
    }
}
