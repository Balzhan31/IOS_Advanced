//
//  HeroDetailViewModel.swift
//  HeroAppMaVer
//
//  Created by Балжан Бозбашава on 25.03.2025.
//

import Foundation

class HeroDetailViewModel: ObservableObject {
    @Published var hero: HeroEntity?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isFavorite: Bool = false
    
    let heroId: Int
    
    init(heroId: Int) {
        self.heroId = heroId
        Task {
            await self.fetchHeroDetails(id: heroId)
        }
    }
    
    func fetchHeroDetails(id: Int) async {
        await MainActor.run {
            self.isLoading = true
        }
        do {
            let fetchedHero = try await HeroService.shared.fetchHeroDetails(id: id)
            await MainActor.run {
                self.hero = fetchedHero
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}



