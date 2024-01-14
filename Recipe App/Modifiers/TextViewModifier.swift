//
//  OnboardingTextViewModifier.swift
//  LoginFigmaPrototipe
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct TextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(.systemGray3), lineWidth: 1)
                    .padding(.horizontal, -12)
            )
            .padding(.horizontal, 24)
    }
}
