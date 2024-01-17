//
//  RegistrationView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 17/01/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var isPasswordValidLength: Bool {
          return password.count >= 6
      }
    var isPasswordWithNumber: Bool {
          return password.contains(where: { $0.isNumber })
      }
    var isPasswordWithUppercase: Bool {
          return password.contains(where: { $0.isUppercase })
      }
    var isPasswordWithLowercase: Bool {
          return password.contains(where: { $0.isLowercase })
      }
    var isPasswordValid: Bool {
           return isPasswordValidLength &&
                  isPasswordWithNumber &&
                  isPasswordWithUppercase &&
                  isPasswordWithLowercase
       }
    
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Welcome!")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Please enter your account here")
                .font(.footnote)
                .foregroundStyle(.gray)
            
            VStack(spacing: 20.0) {
                HStack {
                    Image(systemName: "lock")
                        .fontWeight(.semibold)
                    
                    TextField("Email", text: $email)
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
                
            }
            
            // Sign Up
            VStack(spacing: 16.0) {
                
                Text("Your Password must contain:")
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: isPasswordValidLength ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundColor(isPasswordValidLength ? .green : .gray)
                        
                        Text("Atleast 6 charactes")
                            
                    }
                    
                    HStack {
                        Image(systemName: isPasswordWithNumber ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundColor(isPasswordWithNumber ? .green : .gray)
                        
                        Text("Contains a number")       
                    }
                    
                    HStack {
                        Image(systemName: isPasswordWithUppercase ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundColor(isPasswordWithUppercase ? .green : .gray)
                        
                        Text("Atleast one uppercase letter ")
                            
                    }
                    
                    HStack {
                        Image(systemName: isPasswordWithLowercase ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundColor(isPasswordWithLowercase ? .green : .gray)
                        
                        Text("Atleast one lowercase letter ")
                            
                    }
                    
                }
                .font(.footnote)
                
                Button(action: {
                    
                }, label: {
                    Text("Sign Up")
                        .modifier(RoundedColorButton(color: Color(.green)))
                })
                .opacity(isPasswordValid ? 1 : 0.6)
                .disabled(!isPasswordValid)
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Alreade have an account?")
                        
                        Text("Log In")
                            .foregroundColor(.green)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
            }
        }
        .padding(.vertical, 50)
    }
}

#Preview {
    RegistrationView()
}
