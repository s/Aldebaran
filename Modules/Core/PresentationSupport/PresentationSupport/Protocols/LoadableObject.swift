//
//  LoadableObject.swift
//  PresentationSupport
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI

public protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
