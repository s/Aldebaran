//
//  LaunchesUIView.swift
//  LaunchesUI
//
//  Created by Said Özcan on 11/01/2022.
//

import SwiftUI
import PresentationSupport
import LaunchesUIComponents

public struct LaunchesUIView: View {
    // MARK: -
    private let viewModel: LaunchesUIViewModel
    
    // MARK: -
    public init(viewModel: LaunchesUIViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: -
    public var body: some View {
        GeometryReader { geometry in
            AsyncContentView(source: viewModel) { launches in
                ScrollView {
                    VStack (alignment: .leading) {
                        // TODO: Localize
                        Text("Past Launches")
                            .applyTypography(.h3)
                            .foregroundColor(.white)
                        VStack(spacing: Spacing.medium.rawValue) {
                            ForEach(launches, id: \.id) { launch in
                                // TODO: Localize
                                LaunchView(viewModel: LaunchViewModel(launch: launch))
                            }
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.top)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
