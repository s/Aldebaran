//
//  LoadingState.swift
//  PresentationSupport
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation

public enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
