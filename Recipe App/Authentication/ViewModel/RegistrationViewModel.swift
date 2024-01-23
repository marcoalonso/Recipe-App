//
//  RegistrationViewModel.swift
//  Recipe App
//
//  Created by Marco Alonso Rodriguez on 18/01/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published  var email = ""
    @Published  var password = ""
    @Published  var fullname = ""
    @Published  var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email,
                                      password: password,
                                      fullname: fullname,
                                      username: username)
    }
}
