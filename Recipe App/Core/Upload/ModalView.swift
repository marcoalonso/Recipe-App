//
//  ModalView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 28/01/24.
//

import Foundation
import SwiftUI

struct ModalView: View {
    @Binding var showModal: Bool
    @Binding var selectedTab: Int
    
    // Acceso al entorno de presentación
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing: 32.0) {
                    Image("success")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                    
                VStack(spacing: 16.0) {
                        Text("Upload Success")
                            .font(.title2)
                            .font(.headline)
                        
                        Text("Your recipe has been uploaded, \n you can see it on your profile")
                            .font(.subheadline)
                    }
                    .foregroundColor(.kMainText)
                    
                    Button(action: {
                        self.showModal.toggle()
                        self.selectedTab = 0
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Back to Home")
                            .fontWeight(.semibold)
                            .modifier(RoundedColorButton(color: .kPrimay))
                            .padding(.horizontal, 48)
                    })
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 450)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            
        }
    }
}

#Preview {
    ModalView(showModal: .constant(true), selectedTab: .constant(1))
}
