//
//  LaunchView.swift
//  DashboardUI
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI
import SpaceXDataModels
import PresentationSupport
import MapKit

struct LaunchView: View {
    // MARK: -
    private let viewModel: LaunchViewModel
    
    @State
    private var region: MKCoordinateRegion


    // MARK: -
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
        self.region = MKCoordinateRegion(center: viewModel.launchpadRegionCenter,
                                         span: viewModel.launchpadRegionSpan)
    }
    
    // MARK: -
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.small.rawValue) {
            Text(viewModel.title)
                .applyTypography(.h3)
                .foregroundColor(.white)
            launchContentsView
        }
    }
    
    // MARK: -
    @ViewBuilder
    private var launchContentsView: some View {
        HStack(alignment: .top) {
            VStack(spacing: Spacing.xsmall.rawValue) {
                if viewModel.isUpcomingLaunch {
                    launchpadMapView
                }
                HStack(alignment: .top) {
                    launchMetaDataView
                    Spacer()
                    missionPatchView
                }
            }
        }
        .background(viewModel.isUpcomingLaunch ? Color.tertiaryBackgroundColor : Color.secondaryBackgroundColor)
        .cornerRadius(20)
    }
    
    @ViewBuilder
    private var launchMetaDataView: some View {
        HStack {
            VStack(alignment: .leading, spacing: Spacing.small.rawValue) {
                contentTextView(text: viewModel.launch.name, style: .h5)
                HStack {
                    contentTextView(text: viewModel.launch.rocket.name, style: .h6)
                    contentTextView(text: "•", style: .h6)
                    payloadOrbitView
                }
                descriptionView
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
    
    @ViewBuilder
    private var launchpadMapView: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: viewModel.annotationItems) { item in
                MapPin(coordinate: item.coordinate, tint: .red)
            }
            .border(Color.clear, width: 0)
            .overlay(Color.black.opacity(0.5))
        }
        .frame(height: 156)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [15.0]))
                .fill(Color.white)
        )
        .padding()
    }
    
    @ViewBuilder
    private var missionPatchView: some View {
        if let url = viewModel.launch.links?.patch.small {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 96, height: 96)
        }
    }
    
    @ViewBuilder
    private func contentTextView(text: String, style: Typography.Style) -> some View {
        Text(text)
            .applyTypography(style)
            .foregroundColor(.white)
    }
    
    @ViewBuilder
    private var descriptionView: some View {
        if let details = viewModel.launch.details {
            contentTextView(text: details, style: .h6)
        }
    }
    
    @ViewBuilder
    private var payloadOrbitView: some View {
        if let orbit = viewModel.launch.payloads?.first?.orbit {
            contentTextView(text: orbit, style: .h6)
        }
    }
}


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        let upcomingLaunch = MockDataLoader().upcomingLaunchData()
        LaunchView(viewModel: LaunchViewModel(title: "Upcoming Launch", launch: upcomingLaunch.launches.first!)).previewLayout(.sizeThatFits)
    }
}
