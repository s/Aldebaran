//
//  LaunchView.swift
//  DashboardUI
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI

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
                .font(.title)
                .fontWeight(.bold)
        }
    }
}
