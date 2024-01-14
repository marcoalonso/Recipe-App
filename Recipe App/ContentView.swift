//
//  ContentView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct ContentView: View {
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
                
            }, label: {
                Text("Get Started")
                    .font(.subheadline)
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .background(Color(.green))
                    .cornerRadius(24)
                    .padding(.horizontal, 24)
            })
            //.padding(.top, 40)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
