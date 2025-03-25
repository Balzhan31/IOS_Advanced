//
//  HeroEntity.swift
//  HeroAppMaVer
//
//  Created by Балжан Бозбашава on 24.03.2025.
//
import Foundation

struct HeroEntity: Decodable {
    let id: Int
    let name: String
    let appearance: Appearance
    let images: HeroImage
    var heroImageUrl: URL? {
        URL(string: images.sm)
    }
    let powerstats: PowerStats
    let biography: Biography
    let connections: Connections?
    
    struct PowerStats: Codable {
        let intelligence: Int?
        let strength: Int?
        let speed: Int?
        let durability: Int?
        let power: Int?
        let combat: Int?
    }
    struct Biography: Codable {
        let fullName: String?
        let alterEgos: String?
        let aliases: [String]?
        let placeOfBirth: String?
        let firstAppearance: String?
        let publisher: String?
    }
    
    struct Appearance: Decodable {
        let race: String?
        let height: [String]?
        let weight: [String]?
        let eyeColor: String?
        let hairColor: String?
    }
    
    struct Connections: Codable {
        let groupAffiliation: String?
        let relatives: String?
    }
    
    struct HeroImage: Decodable {
        let sm: String
        let md: String
    }
}
