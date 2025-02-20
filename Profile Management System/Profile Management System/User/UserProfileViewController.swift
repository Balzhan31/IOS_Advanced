//
//  UserProfileViewController.swift
//  Profile Management System
//
//  Created by Балжан Бозбашава on 20.02.2025.
//

import UIKit

class UserProfileViewController: UIViewController {
    var profileManager: ProfileManager?
    var imageLoader: ImageLoader?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileManager()
    }

    func setupProfileManager() {
            profileManager?.onProfileUpdate = { [weak self] profile in
                self?.updateUI(with: profile)
            }
        }

    func updateProfile() {
          profileManager?.loadProfile(id: "someUserId") { [weak self] result in
              switch result {
              case .success(let profile):
                  DispatchQueue.main.async {
                      self?.updateUI(with: profile)
                  }
              case .failure(let error):
                  print("Error: \(error)")
              }
          }
      }
    
    func updateUI(with profile: UserProfile) {
            // Обновите интерфейс пользователя здесь
        }
}
