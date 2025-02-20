//
//  ImageLoaderDelegate.swift
//  Profile Management System
//
//  Created by Балжан Бозбашава on 20.02.2025.
//

import Foundation
import UIKit

protocol ImageLoaderDelegate: AnyObject {
    func imageLoader(_ loader: ImageLoader, didLoad image: UIImage)
    func imageLoader(_ loader: ImageLoader, didFailWith error: Error)
}
