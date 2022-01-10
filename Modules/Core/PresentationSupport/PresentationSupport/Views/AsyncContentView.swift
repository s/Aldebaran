//
//  AsyncContentView.swift
//  PresentationSupport
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI

public struct AsyncContentView<Source: LoadableObject, Content: View>: View {
    // MARK: -
    @ObservedObject var source: Source
    var content: (Source.Output) -> Content
    
    // MARK: -
    public init(source: Source,
         @ViewBuilder content: @escaping (Source.Output) -> Content) {
        self.source = source
        self.content = content
    }

    // MARK: -
    public var body: some View {
        switch source.state {
        case .idle:
            Color.clear.onAppear(perform: source.load)
        case .loading:
            ProgressView().progressViewStyle(StyledProgressView())
        case .failed(let error):
            Text(error.localizedDescription)
            //ErrorView(error: error, retryHandler: source.load)
        case .loaded(let output):
            content(output)
        }
    }
}
