//
//  ViewModel.swift
//  Herothree
//
//  Created by Балжан Бозбашава on 06.03.2025.
//

import Foundation

struct Hero: Decodable {
    let id: Int
    let name: String
    let biography: Biography
    let powerstats: PowerStats
    let appearance: Appearance
    let images: Image
    var imageUrl: URL? {
        URL(string: images.md)
    }

    struct Image: Decodable {
        let md: String
    }
    
    struct Biography: Decodable {
        let fullName: String
        let publisher: String
        let alignment: String
    }
    
    struct PowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    
    struct Appearance: Decodable {
        let height: [String] //first is in feet, second is cm
        let weight: [String] //first is in pounds, second is kg
    }
}

final class ViewModel: ObservableObject {
    @Published var selectedHero: Hero?

    // MARK: - Methods
    func fetchHero() async {
        guard
            let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json")
        else {
            return
        }

        let urlRequest = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let heroes = try JSONDecoder().decode([Hero].self, from: data)
            let randomHero = heroes.randomElement()

            await MainActor.run {
                selectedHero = randomHero
            }
        }
        catch {
            print("Error: \(error)")
        }
    }
}
