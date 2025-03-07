//
//  ContentView.swift
//  Herothree
//
//  Created by Балжан Бозбашава on 06.03.2025.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            if let hero = viewModel.selectedHero {
                VStack(spacing: 12) {
                    AsyncImage(url: hero.imageUrl) { phase in
                        switch phase {
                        case .empty:
                            Color.teal
                                .frame(height: 300)
                                .cornerRadius(20)
                        case .success(let image):
                            image
                                .resizable()
                                .frame(height: 300)
                                .cornerRadius(20)
                        case .failure:
                            Color.purple
                                .frame(height: 300)
                                .cornerRadius(20)
                        }
                    }
                    .padding(32)
                    
                    Text(hero.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Full Name: \(hero.biography.fullName.isEmpty ? "Unknown" : hero.biography.fullName)")
                        .font(.headline)
                        .foregroundColor(.yellow)
                    Text("Publisher: \(hero.biography.publisher)")
                        .font(.subheadline)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Intelligence: \(hero.powerstats.intelligence)")
                        Text("Strength: \(hero.powerstats.strength)")
                        Text("Speed: \(hero.powerstats.speed)")
                        Text("Durability: \(hero.powerstats.durability)")
                        Text("Power: \(hero.powerstats.power)")
                        Text("Combat: \(hero.powerstats.combat)")
                    }
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Height: \(hero.appearance.height.isEmpty ? "Unknown" : hero.appearance.height.last!)")
                        Text("Weight: \(hero.appearance.weight.isEmpty ? "Unknown" : hero.appearance.weight.last!)")
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            } else {
                Text("cheker")
                        .foregroundColor(.gray)
                        .padding()
            }

            Spacer()
            
            Button {
                Task {
                    await viewModel.fetchHero()
                }
            } label: {
                Text("Roll Hero")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    let viewModel = ViewModel()
    ContentView(viewModel: viewModel)
}
