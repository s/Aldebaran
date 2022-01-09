//
//  UpcomingLaunchView.swift
//  UpcomingLaunchUI
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI

public struct UpcomingLaunchView: View {
    // MARK: -
    private let viewModel: UpcomingLaunchViewModel
    
    // MARK: -
    public init(viewModel: UpcomingLaunchViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: -
    public var body: some View {
        Text("Hello, World!")
    }
}
