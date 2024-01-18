//
//  RecipeCellView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 17/01/24.
//

import SwiftUI

struct RecipeCellView: View {
    let recipe : RecipeModel
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: recipe.ownerPicture)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 30, height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Text(recipe.owner)
                    .font(.callout)
                    .foregroundColor(Color(.kSecondaryText))
            }
            
            AsyncImage(url: URL(string: recipe.dishPicture)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 12)
            .overlay {
                Image(systemName: "heart")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 25, height: 22)
                    .padding(.vertical, -50)
                    .padding(.horizontal, -50)
            }
            
            Text(recipe.dishName)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(.kSecondaryText))
            
            HStack {
                Text("Food")
                
                Text("•")
                
                Text("\(recipe.minutesPreparation) min")
            }
            .font(.callout)
            .foregroundColor(Color(.kSecondaryText))
        }
    }
}

#Preview {
    RecipeCellView(recipe: MockData.recipes[0])
}
