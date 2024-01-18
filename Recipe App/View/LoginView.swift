//
//  WelcomeBackView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPresented = false
    @State private var isShowingPassword = false
    
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
                        Image(systemName: "envelope")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        TextField("Email or phone number", text: $email)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                        
                    }
                    .modifier(TextViewModifier())
                        
                    
                    HStack {
                        Image(systemName: "lock")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        if isShowingPassword {
                            TextField("Password", text: $password)
                                .font(.subheadline)
                                .padding(12)
                                .cornerRadius(12)
                        } else {
                            SecureField("Password", text: $password)
                                .font(.subheadline)
                                .padding(12)
                                .cornerRadius(12)
                        }
                        
                            
                        
                        Button(action: {
                            isShowingPassword.toggle()
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
                VStack(spacing: 16.0) {
                    Button(action: {
                        isPresented = true
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
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                            
                            Text("Sign Up")
                                .foregroundColor(.green)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.black)
                        .font(.footnote)
                    }

                }
                
                .fullScreenCover(isPresented: $isPresented, content: {
                    RecipeTabView()
                })
            }
        }
    }
}

#Preview {
    LoginView()
}
