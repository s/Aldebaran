//
//  TabBar.swift
//  PresentationSupport
//
//  Created by Said Özcan on 10/01/2022.
//

import SwiftUI

public struct TabBar: View {
    // MARK: -
    let items: [TabBarItem]
    
    @State
    private var selectedIndex: Int = 0
    
    private static let tabBarHeight: Double = 96

    // MARK: -
    public init(items: [TabBarItem], selectedIndex: Int) {
        self.items = items
        self.selectedIndex = selectedIndex
    }
    
    // MARK: -
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: .zero) {
                    ScrollView {
                        self.items[self.selectedIndex].content
                            .frame(width: geometry.size.width)
                    }
                    Spacer()
                    ZStack {
                        VStack(spacing: .zero) {
                            HStack(spacing: Spacing.xlarge.rawValue) {
                                ForEach(self.items.indices, id: \.self) {
                                    self.item(at: $0)
                                }
                            }
                            .frame(minWidth: geometry.size.width, minHeight: Self.tabBarHeight)
                            .background(Color.secondaryBackgroundColor)
                        }
                    }
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .shadow(color: Color.black.opacity(0.35), radius: 2, x: 2, y: 2)
                    .shadow(color: Color.black.opacity(0.35), radius: 2, x: -2, y: -2)
                }
            }
            .background(Color.primaryBackgroundColor)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    // MARK: -
    private func item(at index: Int) -> some View {
        Button(action: {
            self.selectedIndex = index
        }) {
            VStack(spacing: Spacing.xsmall.rawValue) {
                items[index].image
                items[index].text.applyTypography(.c2)
            }
        }
//        .anchorPreference(key: AnchorKey.self,
//                          value: .bounds,
//                          transform: { self.selectedIndex == index ? $0 : nil })
        .accentColor(index == selectedIndex ? Color.selectedFillColor : Color.unselectedFillColor)
        .padding(30)
    }
}
