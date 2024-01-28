//
//  UploadView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 28/01/24.
//

import SwiftUI

struct UploadView: View {
    @State private var foodName = ""
    @State private var descriptionFood = ""
    @State private var timePreparation = 0.0
    
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 24.0) {
                    
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
                            
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .foregroundColor(.gray)
                                .frame(height: 200)
                            
                            VStack(spacing: 16.0) {
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray)
                                    
                                
                                Text("Add Cover Photo")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("(up to 12 Mb")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onTapGesture {
                            self.showingImagePicker = true
                        }
                    }
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("Food Name")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.leading, 24)
                        
                        TextField("Enter Food Name", text: $foodName)
                            .frame(height: 48)
                            .modifier(TextViewModifier())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.leading, 24)
                        
                        TextField("Tell a little bit about your food", text: $descriptionFood, axis: .vertical)
                            .frame(height: 148) 
                            
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(.systemGray3), lineWidth: 1)
                                    .padding(.horizontal, -12)
                            )
                            .padding(.horizontal, 24)
                    }
                    
                    HStack {
                        Text("Cooking Duration")
                            .foregroundColor(.black)
                        
                        Text("(in minutes)")
                            .foregroundColor(.gray)
                    }
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    
                    // Slider
                    VStack {
                        HStack {
                            Text("<10")
                            
                            Spacer()
                            
                            Text("30")
                            
                            Spacer()
                            
                            Text(">60")
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        
                        
                        Slider(value: $timePreparation, in: 10...70, step: 30.0)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .accentColor(.green)
                    }
                    .padding(.horizontal)
                    
                    
                    NavigationLink {
                        UploadView2(selectedTab: $selectedTab)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Next")
                            .modifier(RoundedColorButton(color: .green))
                    }

                }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(selectedImage: self.$selectedImage, sourceType: .photoLibrary)
                }
            .padding()
            }

        }
    }
}

#Preview {
    UploadView(selectedTab: .constant(1))
}

