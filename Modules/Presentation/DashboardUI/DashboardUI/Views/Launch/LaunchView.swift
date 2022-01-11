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
import AVKit

struct LaunchView: View {
    // MARK: -
    private let viewModel: LaunchViewModel
    
    @State
    private var region: MKCoordinateRegion

    @State
    private var isShowingYoutubePlayer: Bool = false
    
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
            VStack(spacing: Spacing.medium.rawValue) {
                launchHeaderContentView
                HStack(alignment: .top) {
                    launchMetaDataView
                    Spacer()
                    missionPatchView
                }
            }
            .padding()
        }
        .background(viewModel.isUpcomingLaunch ? Color.tertiaryBackgroundColor : Color.secondaryBackgroundColor)
        .cornerRadius(20)
    }
    
    @ViewBuilder
    private var launchHeaderContentView: some View {
        if viewModel.isUpcomingLaunch {
            launchpadMapView
        } else {
            if !isShowingYoutubePlayer {
                youtubeThumbnailView
            } else {
                youtubePlayerView()
            }
        }
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
            }
            Spacer()
        }
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
    private func contentTextView(text: String, style: Typography.Style, foregroundColor: Color = .white) -> some View {
        Text(text)
            .applyTypography(style)
            .foregroundColor(foregroundColor)
    }
    
    @ViewBuilder
    private var descriptionView: some View {
        if let details = viewModel.launch.details {
            contentTextView(text: details, style: .h6)
        }
    }
    
    @ViewBuilder
    private var payloadOrbitView: some View {
        if viewModel.hasPayloads {
            HStack(alignment: .top) {
                ForEach(viewModel.payloads, id: \.self) { payload in
                    VStack {
                        if let orbit = payload  .orbit {
                            contentTextView(text: orbit, style: .h6, foregroundColor: Color.tertiaryBackgroundColor)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(5)
                }
            }
        }
    }
    
    @ViewBuilder
    private var youtubeThumbnailView: some View {
        if let url = viewModel.youtubeVideoThumbnailURL {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 156)
            } placeholder: {
                Color.clear
            }
            .cornerRadius(10)
            .overlay(youtubeThumbnailViewOverlay)
            .onTapGesture {
                isShowingYoutubePlayer = true
            }
        }
    }
    
    @ViewBuilder
    private var youtubeThumbnailViewOverlay: some View {
        Image(systemName: "play.circle.fill")
            .font(.system(size: 60))
            .foregroundColor(Color.primaryBackgroundColor)
            .cornerRadius(30)
    }
    
    @ViewBuilder
    private func youtubePlayerView() -> some View {
        if let youtubeVideoID = viewModel.youtubeVideoID {
            YoutubeEmbedPlayerView(videoID: youtubeVideoID,
                                   activityIndicatorViewTintColor: .white,
                                   backgroundColor: Color.secondaryBackgroundColor)
                .frame(height: 156)
                .transition(.scale)
        }
    }
}


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        let upcomingLaunch = MockDataLoader().upcomingLaunchData()
        LaunchView(viewModel: LaunchViewModel(title: "Upcoming Launch", launch: upcomingLaunch.launches.first!)).previewLayout(.sizeThatFits)
    }
}
