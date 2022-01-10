//
//  LaunchView.swift
//  DashboardUI
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI
import SpaceXDataModels
import PresentationSupport

struct LaunchView: View {
    // MARK: -
    private let viewModel: LaunchViewModel
    
    // MARK: -
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: -
    var body: some View {
        VStack (alignment: .leading) {
            Text(viewModel.title)
                .applyTypography(.h1)
                .foregroundColor(.white)
            Text(viewModel.launch.name)
            Spacer()
        }
        .padding()
        .background(Color.secondaryBackgroundColor)
    }
}


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        let upcomingLaunch = MockDataLoader().upcomingLaunchData()
        LaunchView(viewModel: LaunchViewModel(title: "Upcoming Launch", launch: upcomingLaunch.launches.first!)).previewLayout(.sizeThatFits)
    }
}
