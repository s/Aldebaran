//
//  LoadingState.swift
//  PresentationSupport
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation

public enum LoadingState<Value>: Equatable {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
    
    public static func == (lhs: LoadingState<Value>, rhs: LoadingState<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.loading, .loading): return true
        case (.failed(_), .failed(_)): return true
        case (.loaded(_), .loaded(_)): return true
        default: return false
        }
    }
}
