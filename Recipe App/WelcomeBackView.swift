//
//  WelcomeBackView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct WelcomeBackView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16.0) {
                Text("Welcome Back!")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Please enter your account here")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
                VStack(spacing: 20.0) {
                    HStack {
                        Image(systemName: "lock")
                            .fontWeight(.semibold)
                        
                        TextField("Email or phone number", text: $email)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "eye")
                                .foregroundColor(.gray)
                        })
                    }
                    .modifier(TextViewModifier())
                        
                    
                    HStack {
                        Image(systemName: "lock")
                            .fontWeight(.semibold)
                        
                        TextField("Password", text: $password)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                            
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "eye")
                                .foregroundColor(.gray)
                        })
                    }
                    .modifier(TextViewModifier())
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot Password?")
                                .foregroundStyle(.black)
                        })
                    }
                    .padding(.trailing, 24)
                }
                
                // Login Buttons
                VStack {
                    Button(action: {
                        
                    }, label: {
                        Text("Login")
                            .modifier(RoundedColorButton(color: Color(.green)))
                    })
                    
                    Text("Or continue with")
                        .foregroundStyle(.gray)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Google")
                            .modifier(RoundedColorButton(color: Color(.orange)))
                    })
                }
            }
        }
    }
}

#Preview {
    WelcomeBackView()
}