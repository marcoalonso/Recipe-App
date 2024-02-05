//
//  HomeView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 17/01/24.
//

import SwiftUI

enum CategoryFood: String, CaseIterable {
    case All
    case Food
    case Drink
    case Snack
    case Desert
}

struct HomeView: View {
    @State private var recipeToSearch = ""
    @State private var selectedCategory: CategoryFood = .All
    @StateObject var viewModel = HomeViewModel()
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //search
                    
                    VStack(alignment: .leading) {
                        // category
                        Text("Category")
                            .font(.title)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(CategoryFood.allCases, id: \.self) { category in
                                    Text(category.rawValue)
                                        .frame(width: 70)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(selectedCategory == category ? .white : Color(.kMainText))
                                        .padding()
                                        .background(selectedCategory == category ? Color(.kPrimay) : Color(.systemGray6))
                                        .cornerRadius(24)
                                        .onTapGesture {
                                            selectedCategory = category
                                        }
                                }
                                
                            }
                        }
                        
                    }
                    .padding()
                    
                    
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 6)
                        .foregroundColor(Color(.systemGray6))
                    
                    Spacer()
                    // Grid Posts
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout) {
                            ForEach(viewModel.recipes) { item in
                                RecipeCellView(recipe: item)
                                    
                            }
                        }
                        .padding()
                    }
                    
                }
                .searchable(text: $recipeToSearch)
            }
            
            
        }
    }
}

#Preview {
    HomeView()
}
