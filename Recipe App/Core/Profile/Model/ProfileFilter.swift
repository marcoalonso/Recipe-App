//
//  ProfileFilter.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 23/01/24.
//

import Foundation

enum ProfileFilter: Int, CaseIterable, Identifiable {
    case recipes
    case liked
    
    var title: String {
        switch self {
        case .recipes:
            return "Recipes"
        case .liked:
            return "Liked"
        }
    }
    
    var id: Int { return self.rawValue }
}
