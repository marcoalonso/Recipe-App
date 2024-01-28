//
//  AuthService.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 18/01/24.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("User logged! \(result.user)")
        } catch {
            print("Error loggin the user ... \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("User created \(result.user.uid)")
        } catch {
            print("Error creating user ... \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil 
    }
}
