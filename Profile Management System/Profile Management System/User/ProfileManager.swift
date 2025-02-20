//
//  ProfileManager.swift
//  Profile Management System
//
//  Created by Балжан Бозбашава on 20.02.2025.
//

import Foundation

class ProfileManager {
    private var activeProfiles: [String: UserProfile] = [:]
    weak var delegate: ProfileUpdateDelegate?
    var onProfileUpdate: ((UserProfile) -> Void)?

    init(delegate: ProfileUpdateDelegate) {
        self.delegate = delegate
    }

    func loadProfile(id: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        //загрузка профиля используя слабую ссылку
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self, let profile = self.activeProfiles[id] else {
                completion(.failure(NSError(domain: "ProfileError", code: 404, userInfo: nil)))
                return
            }
            DispatchQueue.main.async {
                completion(.success(profile))
                self.onProfileUpdate?(profile)
            }
        }
    }
}
