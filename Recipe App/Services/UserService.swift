//
//  UserService.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        //fetch data from firebase
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("Debug: current user \(user)")

    }
    
    func reset() {
        self.currentUser = nil
    }
}
