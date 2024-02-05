//
//  RecipeModel.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 17/01/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct RecipeModel: Identifiable, Codable {
    @DocumentID var recipeId: String?
    
    let owner: String
    let coverPictureUrl: String?
    let stepsPictureUrl: String?
    let foodName: String
    let descriptionPreparation: String
    let ingredients: [String]
    let minutesPreparation: Int
    let steps: String
    
    var id: String {
        return recipeId ?? NSUUID().uuidString
    }
    
    var user: User?
}


