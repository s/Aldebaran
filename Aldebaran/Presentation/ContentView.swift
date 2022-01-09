//
//  ContentView.swift
//  Aldebaran
//
//  Created by Said Özcan on 06/01/2022.
//

import SwiftUI
import DashboardUI

struct ContentView: View {
    // MARK: -
    @Environment(\.presentationProvider)
    var presentationProvider

    // MARK: -
    var body: some View {
        presentationProvider.dashboardUIProvider.createUI()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
