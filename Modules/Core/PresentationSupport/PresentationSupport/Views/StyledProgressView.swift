//
//  StyledProgressView.swift
//  PresentationSupport
//
//  Created by Said Özcan on 10/01/2022.
//

import SwiftUI

struct StyledProgressView: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .scaleEffect(1.5)
    }
}
