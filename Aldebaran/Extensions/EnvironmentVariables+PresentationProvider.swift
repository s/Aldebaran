//
//  EnvironmentVariables+PresentationProvider.swift
//  Aldebaran
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI

// MARK: -
struct PresentationProviderKey: EnvironmentKey {
  static let defaultValue = PresentationProvider()
}

// MARK: -
extension EnvironmentValues {
  var presentationProvider: PresentationProvider {
    get { self[PresentationProviderKey.self] }
    set { self[PresentationProviderKey.self] = newValue }
  }
}
