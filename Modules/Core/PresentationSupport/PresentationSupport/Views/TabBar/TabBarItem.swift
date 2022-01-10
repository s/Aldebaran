//
//  TabBarItem.swift
//  PresentationSupport
//
//  Created by Said Özcan on 10/01/2022.
//

import Foundation
import SwiftUI

public protocol TabBarItem {
    var image: Image { get }
    var text: Text { get }
    var content: AnyView { get }
}
