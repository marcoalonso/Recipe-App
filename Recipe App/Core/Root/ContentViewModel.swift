//
//  ContentViewModel.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 23/01/24.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    // Recibir la sesion del usuario desde Auth service
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setubSubscribers()
    }
    
    private func setubSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
