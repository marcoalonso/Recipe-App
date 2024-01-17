//
//  ContentView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    
    var body: some View {
        VStack(alignment: .center) {
            Image("foods")
                .resizable()
                .frame(height: 400)
            
            VStack(spacing: 30.0) {
                Text("Start Cooking")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Let's join our community \n to cook better food!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
                
            
            Spacer()
            
            Button(action: {
                isPresented = true
            }, label: {
                Text("Get Started")
                    .modifier(RoundedColorButton(color: Color(.green)))
            })
            //.padding(.top, 40)
            
            Spacer()
                .fullScreenCover(isPresented: $isPresented, content: {
                    LoginView()
                })
        }
    }
}

#Preview {
    ContentView()
}
