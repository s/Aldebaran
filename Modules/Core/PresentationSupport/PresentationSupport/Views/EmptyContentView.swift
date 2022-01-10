//
//  EmptyContentView.swift
//  PresentationSupport
//
//  Created by Said Özcan on 09/01/2022.
//

import SwiftUI

public struct EmptyContentView: View {
    public init() {}
    public var body: some View {
        Text("Empty Content!")
    }
}

struct EmptyContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyContentView()
    }
}
