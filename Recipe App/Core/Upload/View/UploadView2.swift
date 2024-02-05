//
//  UploadView2.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 28/01/24.
//

import SwiftUI
import Firebase
import PhotosUI

struct UploadView2: View {
    @ObservedObject var viewModel: UploadRecipeViewModel
    
    @State private var ingredients: [String] = [""]
    @Environment(\.dismiss) private var dismiss
    @State private var selectedImage: UIImage?
    @Binding var selectedTab: Int
    @State private var showModal = false
    
    @State private var stepsPreparation = ""
    
    // Acceso al entorno de presentación
    @Environment(\.presentationMode) var presentationMode
    
    private func cleanFields() {
        ingredients.removeAll()
        stepsPreparation = ""
        viewModel.recipeStepsImage = nil
        viewModel.recipeCoverImage = nil
        viewModel.foodName = ""
        viewModel.descriptionFood = ""
        viewModel.timePreparation = 0.0
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24.0) {
                HStack {
                    Text("Ingredients")
                        .font(.title2)
                        .foregroundColor(.kMainText)
                    
                    Spacer()
                    
                    Text("+  Group")
                        .font(.title2)
                        .foregroundColor(.kMainText)
                }
                
                ForEach(0..<ingredients.count, id: \.self) { index in
                    HStack {
                        Image(systemName: "slider.horizontal.3")
                        
                        TextField("Enter ingredient", text: self.binding(forIndex: index))
                            .frame(height: 48)
                            .modifier(TextViewModifier())
                    }
                }
                
                
                Button(action: {
                    self.addIngredient()
                }, label: {
                    Text("+ Ingredient")
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .font(.title3)
                        .foregroundColor(.kMainText)
                        .modifier(TextViewModifier())
                })
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 6)
                    .foregroundColor(Color(.systemGray6))
                    .padding(.horizontal, -40)
                
                
                
                
                Text("Steps")
                    .font(.title)
                    .foregroundColor(.kMainText)
                
                HStack(alignment: .top) {
                    VStack(spacing: 16.0) {
                        Image("numberone")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Image(systemName: "slider.horizontal.3")
                    }
                    .padding(.vertical, 12)
                    
                    VStack {
                        TextField("Tell a little bit about your food", text: $stepsPreparation, axis: .vertical)
                            .frame(height: 148)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(.systemGray3), lineWidth: 1)
                                    .padding(.horizontal, -12)
                            )
                            .padding(.horizontal, 24)
                        
                        PhotosPicker(selection: $viewModel.stepsPhoto) {
                            if let image = viewModel.recipeStepsImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .cornerRadius(15)
                                
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                    //.background(Color(.systemGray6))
                                        .foregroundColor(Color(.systemGray6))
                                        .frame(height: 50)
                                        .padding(.horizontal, 10)
                                    
                                    
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.kMainText)
                                }
                            }/// PhotosPicker
                        }
                        
                    }
                }
                
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Back")
                            .frame(height: 60)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.kMainText)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .background(Color(.systemGray6))
                            .cornerRadius(30)
                    })
                    
                    Button(action: {
                        Task {
                            try await viewModel.uploadRecipe(recipe:
                                                                RecipeModel(owner: "",
                                                                            coverPictureUrl: "",
                                                                            stepsPictureUrl: "",
                                                                            foodName: viewModel.foodName,
                                                                            descriptionPreparation: viewModel.descriptionFood,
                                                                            ingredients: ingredients,
                                                                            minutesPreparation: Int(viewModel.timePreparation),
                                                                            steps: stepsPreparation))
                            self.showModal = true
                            cleanFields()
                        }
                        
                    }, label: {
                        Text("Next")
                            .frame(height: 60)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .background(.kPrimay)
                            .cornerRadius(30)
                    })
                }
                .padding(.vertical, 32)
                
            }
            .fullScreenCover(isPresented: $showModal, content: {
                ModalView(showModal: $showModal, selectedTab: $selectedTab)
            })
            .padding(.vertical, 50)
            .padding(.horizontal, 24)
            
        }
    }
    
    private func binding(forIndex index: Int) -> Binding<String> {
            return Binding<String>(
                get: {
                    self.ingredients[index]
                },
                set: { newValue in
                    self.ingredients[index] = newValue
                }
            )
        }
        
        private func addIngredient() {
            ingredients.append("")
        }
}

#Preview {
    UploadView2(viewModel: UploadRecipeViewModel(), selectedTab: .constant(1))
}





