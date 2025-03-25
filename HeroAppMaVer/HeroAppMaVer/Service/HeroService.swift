//
//  HeroService.swift
//  HeroAppMaVer
//
//  Created by Балжан Бозбашава on 24.03.2025.
//
import Foundation

protocol HeroService {
    func fetchHeroes() async throws -> [HeroEntity]
    // fetchHeroById(id: Int) -> HeroEntity
}

enum HeroError: Error {
    case wrongUrl
    case somethingWentWrong
}

private enum Constants {
    static let baseUrl: String = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/"
}


struct HeroServiceImpl: HeroService {
    func fetchHeroes() async throws -> [HeroEntity] {
        let urlString = Constants.baseUrl + "all.json"
        guard let url = URL(string: urlString) else {
            throw HeroError.wrongUrl
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse?.statusCode ?? 0)

            let heroes = try JSONDecoder().decode([HeroEntity].self, from: data)
            return heroes
        } catch {
            print(error)
            throw HeroError.somethingWentWrong
        }
    }
    
    func fetchHeroDetails(id: Int) async throws -> HeroEntity {
            guard let url = URL(string: "\(baseURL)/id/\(id).json") else {
                throw NetworkError.invalidURL
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            return hero
        }

    
}

