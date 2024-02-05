//
//  AuthService.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 18/01/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

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
            try await UserService.shared.fetchCurrentUser()
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
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            print("User created \(result.user.uid)")
        } catch {
            print("Error creating user ... \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil 
        UserService.shared.reset()
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String,
                                fullname: String,
                                username: String,
                                id: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
