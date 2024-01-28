//
//  UploadView2.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 28/01/24.
//

import SwiftUI

struct UploadView2: View {
    @State private var ingredients: [String] = [""]
    @State private var descriptionFood = ""
    
    @Environment(\.dismiss) private var dismiss
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    @Binding var selectedTab: Int
    @State private var showModal = false
    
    // Acceso al entorno de presentación
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            ZStack {
                Color.black.opacity(showModal ? 0.4 : 0) // Fondo semi-transparente
                    .edgesIgnoringSafeArea(.all)
                
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
                    
                    // Modal
                    if showModal {
                        ModalView(showModal: $showModal, selectedTab: $selectedTab)
                            .transition(.scale)
                            .animation(.easeInOut(duration: 0.3))
                            .zIndex(1)
                    }

                    
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
                            TextField("Tell a little bit about your food", text: $descriptionFood, axis: .vertical)
                                .frame(height: 148)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.systemGray3), lineWidth: 1)
                                        .padding(.horizontal, -12)
                                )
                                .padding(.horizontal, 24)
                            
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .cornerRadius(15)
                                    .onTapGesture {
                                        self.showingImagePicker = true
                                    }
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
                                .onTapGesture {
                                    self.showingImagePicker = true
                                }
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
                            // Subir datos y cuando se carguen mostrar modal, al dar Ok hacer:
                            self.showModal = true
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
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(selectedImage: self.$selectedImage, sourceType: .photoLibrary)
                }
                .padding(.vertical, 50)
            .padding(.horizontal, 24)
            }
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
    UploadView2(selectedTab: .constant(1))
}





