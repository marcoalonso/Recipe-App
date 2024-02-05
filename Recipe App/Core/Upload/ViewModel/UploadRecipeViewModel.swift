//
//  UploadRecipeViewModel.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 05/02/24.
//

import SwiftUI
import Firebase
import PhotosUI

class UploadRecipeViewModel: ObservableObject {
    @Published var foodName = ""
    @Published var descriptionFood = ""
    @Published var timePreparation = 0.0
    
    @Published var coverPhoto: PhotosPickerItem? {
        didSet { Task { await loadImageCover() } }
    }
    
    @Published var stepsPhoto: PhotosPickerItem? {
        didSet { Task { await loadImageSteps() } }
    }
    
    @Published var recipeCoverImage: Image?
    @Published var recipeStepsImage: Image?
    
    private var coverUiImage: UIImage?
    private var stepsUiImage: UIImage?
    
    @Published var urlCoverImage = ""
    
    @MainActor
    private func loadImageCover() async {
        guard let item = coverPhoto else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.coverUiImage = uiImage
        self.recipeCoverImage = Image(uiImage: uiImage)
    }
    
    @MainActor
    private func loadImageSteps() async {
        guard let item = stepsPhoto else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.stepsUiImage = uiImage
        
        self.recipeStepsImage = Image(uiImage: uiImage)
    }
    
    @MainActor
    func uploadRecipe(recipe: RecipeModel) async throws {
        guard let coverImage = self.coverUiImage else {
            return
        }
        guard let stepsImage = self.stepsUiImage else {
            return
        }
        guard let imageCoverUrl = try await ImageUploader.uploadImageAndGetUrl(coverImage) else { return }
        guard let imageStepsUrl = try await ImageUploader.uploadImageAndGetUrl(stepsImage) else { return }
        
        getUsernameFromDocumentId { username in
            if let user = username {
                print("Debug: username \(username)")
                let newRecipe = RecipeModel(owner: user, coverPictureUrl: imageCoverUrl, stepsPictureUrl: imageStepsUrl, foodName: recipe.foodName, descriptionPreparation: recipe.descriptionPreparation, ingredients: recipe.ingredients, minutesPreparation: recipe.minutesPreparation, steps: recipe.steps)
                
                Task {
                    try await RecipeService.uploadRecipe(newRecipe)
                }
            }
        }
        
        
        
    }
    
    func getUsernameFromDocumentId(completion: @escaping (String?) -> Void) {
        let db = Firestore.firestore()

        guard let uid = Auth.auth().currentUser?.uid else { return }
        // Realizar una consulta para obtener el documento por el ID
        db.collection("users").document(uid).getDocument { (documentSnapshot, error) in
            
            if let error = error {
                print("Error obteniendo el documento: \(error)")
                completion(nil)
            } else if let documentSnapshot = documentSnapshot {
                // Si el documento existe, obtener el campo de "username"
                if let username = documentSnapshot.data()?["username"] as? String {
                    completion(username)
                    print("Debug: username \(username)")

                } else {
                    print("No se encontró el campo 'username' en el documento.")
                    completion(nil)
                }
            } else {
                print("No se encontró ningún documento con el ID dado.")
                completion(nil)
            }
        }
    }
}
