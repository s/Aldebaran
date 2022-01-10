//
//  LaunchContentView.swift
//  DashboardUI
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI
import SpaceXDataModels

struct LaunchContentView: View {
    // MARK: -
    private let viewModel: LaunchViewModel
    
    // MARK: -
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: -
    var body: some View {
        Text("Hello, World!")
    }
}

struct LaunchContentView_Previews: PreviewProvider {
    static var previews: some View {
        let upcomingLaunch = MockDataLoader().upcomingLaunchData()
        LaunchContentView(viewModel: LaunchViewModel(title: "Upcoming Launch", launch: upcomingLaunch.launches.first!)).previewLayout(.sizeThatFits)
    }
}
