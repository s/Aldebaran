//
//  ContentView.swift
//  Aldebaran
//
//  Created by Said Özcan on 06/01/2022.
//

import SwiftUI
import DashboardUI
import PresentationSupport

struct ContentView: View {
    // MARK: -
    @Environment(\.presentationProvider)
    var presentationProvider
    
    @State
    var selectedTabIndex: Int = 0
    
    // MARK: -
    var body: some View {
        TabBar(items: presentationProvider.tabBarItems, selectedIndex: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
