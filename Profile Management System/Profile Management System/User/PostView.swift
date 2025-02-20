//
//  PostView.swift
//  Profile Management System
//
//  Created by Балжан Бозбашава on 20.02.2025.
//

import Foundation
import UIKit

class PostView {
    var imageLoader: ImageLoader?
    
    func setupImageLoader() {
        imageLoader?.loadImage(from: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_37DYWY9EbDypftu9v2qSyDZu6Q")!) { [weak self] result in
            switch result {
            case .success(let image):
                self?.displayImage(image)
            case .failure(let error):
                print("Failed to load image: \(error)")
            }
        }
    }
    
    func displayImage(_ image: UIImage) {
    
    }
}
