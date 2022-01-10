//
//  AldebaranApp.swift
//  Aldebaran
//
//  Created by Said Özcan on 06/01/2022.
//

import SwiftUI

@main
struct AldebaranApp: App {
    // MARK: -
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.presentationProvider, PresentationProvider())
        }
    }
}
