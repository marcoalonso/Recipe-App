//
//  RecipeService.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 05/02/24.
//

import Foundation

import Firebase
import FirebaseFirestoreSwift

struct RecipeService {
    static func uploadRecipe(_ recipe: RecipeModel) async throws {
        guard let recipeData = try? Firestore.Encoder().encode(recipe) else { return }
        try await Firestore.firestore().collection("recipes").addDocument(data: recipeData)
    }
    
    @MainActor
    static func updateRecipeCoverPicture(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("recipes").document(currentUid).updateData([
            "coverPictureUrl": imageUrl
        ])
        // self.currentUser?.profileImageUrl = imageUrl
    }
    
    static func fetchRecipes() async throws -> [RecipeModel] {
        let snapshot = try await Firestore
            .firestore()
            .collection("recipes")
            .order(by: "foodName", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: RecipeModel.self) })
    }
}
