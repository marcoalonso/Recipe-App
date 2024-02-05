//
//  ProfileViewModel.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import Foundation

import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("Debug: user viewmodel is \(user)")

        }.store(in: &cancellables)
    }
}
