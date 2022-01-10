//
//  Typography.swift
//  PresentationSupport
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation
import SwiftUI

public struct Typography: ViewModifier {
    
    public enum Style {
        /// Titles
        case h1, h2, h3, h4, h5, h6
        
        /// Subtitles
        case s1, s2
        
        /// Paragraphs
        case p1, p2
        
        /// Captions
        case c1, c2

    }
    
    var style: Style
        
    public func body(content: Content) -> some View {
        switch style {
        case .h1: return content
            .font(.system(size: 36, weight: .bold))
        case .h2: return content
            .font(.system(size: 32, weight: .bold))
        case .h3: return content
            .font(.system(size: 30, weight: .bold))
        case .h4: return content
            .font(.system(size: 26, weight: .bold))
        case .h5: return content
            .font(.system(size: 22, weight: .bold))
        case .h6: return content
            .font(.system(size: 18, weight: .bold))
            
        case .s1: return content
            .font(.system(size: 15, weight: .semibold))
        case .s2: return content
            .font(.system(size: 13, weight: .semibold))
            
        case .p1: return content
            .font(.system(size: 15, weight: .regular))
        case .p2: return content
            .font(.system(size: 13, weight: .regular))
            
        case .c1: return content
            .font(.system(size: 12, weight: .regular))
        case .c2: return content
            .font(.system(size: 12, weight: .bold))
        }
    }
}

extension View {
    public func applyTypography(_ style: Typography.Style) -> some View {
        self
            .modifier(Typography(style: style))
    }
    
    public func applyTypography(_ style: Typography.Style, color: Color) -> some View {
        self
            .modifier(Typography(style: style))
            .foregroundColor(color)
    }
}
