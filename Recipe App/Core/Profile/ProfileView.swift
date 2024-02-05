//
//  ProfileView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 23/01/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileFilter = .recipes
    @Namespace var animation
    @StateObject var viewModel = ProfileViewModel()
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    private var filterBarWidth : CGFloat {
        let count = CGFloat(ProfileFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    // Image
                    VStack {
                        Image("alonso")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                        
                        Text(currentUser?.fullname ?? "")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.kSecondaryText)
                    }
                    
                    //Stats
                    HStack(spacing: 36.0) {
                        VStack {
                            Text("32")
                                .fontWeight(.semibold)
                            
                            Text("Recipes")
                                .font(.footnote)
                        }
                        
                        VStack {
                            Text("782")
                                .fontWeight(.semibold)
                            
                            Text("Following")
                                .font(.footnote)
                        }
                        
                        VStack {
                            Text("1,432")
                                .fontWeight(.semibold)
                            
                            Text("Followers")
                                .font(.footnote)
                        }
                        
                        
                    }
                    .foregroundColor(.kSecondaryText)
                    
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 6)
                        .foregroundColor(Color(.systemGray6))
                    
                    //Segmented control
                    
                    VStack {
                        HStack {
                            ForEach(ProfileFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .frame(width: filterBarWidth, height: 1)
                                            .foregroundColor(.black)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .frame(width: filterBarWidth, height: 1)
                                            .foregroundColor(.clear)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        // Content
                        LazyVGrid(columns: gridItemLayout) {
                            ForEach(0 ... 10, id: \.self) { recipe in
                                RecipeCellView(recipe: MockData.recipes[0])
                            }
                        }
                        .padding(.vertical, 20)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Cerrar sesion
                        AuthService.shared.signOut()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    })
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileView()
}
