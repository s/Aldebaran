//
//  YoutubeEmbedPlayerController.swift
//  PresentationSupport
//
//  Created by Said Özcan on 11/01/2022.
//

import UIKit
import YouTubeiOSPlayerHelper
import SwiftUI

public final class YoutubeEmbedPlayerController: UIViewController, YTPlayerViewDelegate {
    // MARK: -
    private let videoID: String
    private let activityIndicatorViewTintColor: UIColor
    private let backgroundColor: UIColor
    private lazy var playerView: YTPlayerView = self.createPlayerView()
    private lazy var activityIndicatorView: UIActivityIndicatorView = self.createActivityIndicatorView()
    
    // MARK: -
    public init(videoID: String, activityIndicatorViewTintColor: UIColor, backgroundColor: UIColor) {
        self.videoID = videoID
        self.activityIndicatorViewTintColor = activityIndicatorViewTintColor
        self.backgroundColor = backgroundColor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = self.backgroundColor
        
        view.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: -
    func load() {
        addPlayer()
        playerView.load(withVideoId: videoID)
    }
    
    // MARK: -
    private func addPlayer() {
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: -
    private func createPlayerView() -> YTPlayerView {
        let playerView = YTPlayerView(frame: CGRect.zero)
        playerView.alpha = 0
        playerView.backgroundColor = self.backgroundColor
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.delegate = self
        return playerView
    }
    
    private func createActivityIndicatorView() -> UIActivityIndicatorView {
        let progressView = UIActivityIndicatorView(style: .large)
        progressView.color = self.activityIndicatorViewTintColor
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.hidesWhenStopped = true
        progressView.startAnimating()
        return progressView
    }
    
    public func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        activityIndicatorView.stopAnimating()
        playerView.alpha = 1.0
    }
}

public struct YoutubeEmbedPlayerView: UIViewControllerRepresentable {
    // MARK: -
    private let videoID: String
    private let activityIndicatorViewTintColor: Color
    private let backgroundColor: Color

    
    // MARK: -
    public init(videoID: String, activityIndicatorViewTintColor: Color, backgroundColor: Color) {
        self.videoID = videoID
        self.activityIndicatorViewTintColor = activityIndicatorViewTintColor
        self.backgroundColor = backgroundColor
    }
    
    // MARK: -
    public func makeUIViewController(context: Context) -> YoutubeEmbedPlayerController {
        YoutubeEmbedPlayerController(videoID: videoID, activityIndicatorViewTintColor: UIColor(activityIndicatorViewTintColor), backgroundColor: UIColor(backgroundColor))
    }
    
    public func updateUIViewController(_ uiViewController: YoutubeEmbedPlayerController, context: Context) {
        uiViewController.load()
    }
    
    public typealias UIViewControllerType = YoutubeEmbedPlayerController
}
