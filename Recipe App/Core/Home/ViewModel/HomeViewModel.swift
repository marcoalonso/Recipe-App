//
//  HomeViewModel.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 05/02/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var recipes = [RecipeModel]()
    
    init() {
        Task {
            try await fetchRecipes()
        }
    }
    
    @MainActor
    func fetchRecipes() async throws {
        self.recipes = try await RecipeService.fetchRecipes()
        
    }
}
