//
//  TitleSubtitleView.swift
//  PresentationSupport
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI

struct TitleSubtitleView: View {
    // MARK: -
    private let title: String
    private let subtitle: String
    
    // MARK: -
    public init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    // MARK: -
    var body: some View {
        VStack (alignment: .leading, spacing: Spacing.small.rawValue) {
            Text(title).applyTypography(.s1, color: .black)
            Text(subtitle).applyTypography(.p2, color: .gray)
        }
    }
}

struct TitleSubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleSubtitleView(title: "Title", subtitle: "Subtitle")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
