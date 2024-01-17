//
//  RecipeTabView.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 17/01/24.
// Figma
// https://www.figma.com/file/KQe1KVeCZEvrahlpl52hFK/Recipeo---Recipe-App-UI-(Community)?type=design&node-id=156-0&mode=design&t=jhi9xsv9gdAqUUpS-0

import SwiftUI

struct RecipeTabView: View {
    @State private var selectedTab = 0
    @State private var showCreateThreadView = false
    
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            Text("Home")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house").environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            Text("Upload")
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "pencil.line" : "pencil")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            Text("Scan")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            Text("Notification")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "bell.fill" : "bell")
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            Text("Profile")
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
        })
        .onChange(of: selectedTab, perform: { newValue in
            showCreateThreadView = selectedTab == 2
        })
        .sheet(isPresented: $showCreateThreadView, onDismiss: {
            selectedTab = 0
        }, content: {
            ScanFoodView()
        })
        .tint(.kPrimay)
    }
}

#Preview {
    RecipeTabView()
}
