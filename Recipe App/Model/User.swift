//
//  User.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 23/01/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
