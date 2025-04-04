//
//  ContentView.swift
//  Pinterest
//
//  Created by Балжан Бозбашава on 03.04.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ImagesViewModel = ImagesViewModel()

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
//        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.images) { model in
                        model.image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .clipped()
                    }
                }
                .padding()
            }

            Button("Get 5 Images") {
                viewModel.getImages()
            }
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView(viewModel: ImagesViewModel())
}
