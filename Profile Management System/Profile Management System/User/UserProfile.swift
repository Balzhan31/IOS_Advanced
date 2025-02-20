//
//  UserProfile.swift
//  Profile Management System
//
//  Created by Балжан Бозбашава on 20.02.2025.
//

import Foundation

class UserProfile {
    let id: String
    var username: String
    var bio: String

    init(id: String, username: String, bio: String) {
        self.id = id
        self.username = username
        self.bio = bio
    }
}
