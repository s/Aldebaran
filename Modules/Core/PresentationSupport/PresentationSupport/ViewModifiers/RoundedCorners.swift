//
//  RoundedCorners.swift
//  PresentationSupport
//
//  Created by Said Özcan on 10/01/2022.
//

import SwiftUI

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

public struct RoundedCorner: Shape {
    // MARK: -
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    // MARK: -
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
