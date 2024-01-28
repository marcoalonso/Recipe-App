//
//  RoundedGreenButton.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct RoundedColorButton: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.horizontal)
            .background(color)
            .cornerRadius(24)
            .padding(.horizontal, 24)
    }
}

struct RoundedColorButtonPadding: ViewModifier {
    let color: Color
    let padding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.horizontal)
            .background(color)
            .cornerRadius(24)
            .padding(.horizontal, padding)
    }
}
