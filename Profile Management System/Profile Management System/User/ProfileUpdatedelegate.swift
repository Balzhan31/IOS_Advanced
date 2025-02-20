//
//  ProfileUpdatedelegate.swift
//  Profile Management System
//
//  Created by Балжан Бозбашава on 20.02.2025.
//

import Foundation

//чтобы избежать циклов удержания при использовании делегатов
protocol ProfileUpdateDelegate: AnyObject {
    func profileDidUpdate(_ profile: UserProfile)
    func profileLoadingError(_ error: Error)
}
