//
//  ContentView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    /// -* Creamos una instancia del VM para validar si Auth service encuentra una sesion activa de firebase
    @StateObject var viewModel = ContentViewModel()
    
    @State private var isVStackVisible: Bool = true
    
    var body: some View {
        VStack {
            /// Onboarding solo mostrar la primera vez
            if isVStackVisible {
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
                        UserDefaults.standard.set(true, forKey: "Onboarding")
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
            } else {
                Group {
                    if viewModel.userSession != nil {
                        RecipeTabView()
                    } else {
                        LoginView()
                    }
                }
            }
        }
        .onAppear {
            // Validamos si el usuario ya vio el onboarding
            if UserDefaults.standard.bool(forKey: "Onboarding") {
                isVStackVisible = false
            }
        }
    }
}

#Preview {
    ContentView()
}
