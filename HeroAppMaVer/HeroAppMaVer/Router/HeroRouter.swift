//
//  HeroRouter.swift
//  HeroAppMaVer
//
//  Created by Балжан Бозбашава on 25.03.2025.
//

import SwiftUI
import UIKit

final class HeroRouter {
    var rootViewController: UINavigationController?

    func showDetails(for id: Int) {
        let detailVC = makeDetailViewController(id: id)
        rootViewController?.pushViewController(detailVC, animated: true)
    }

    private func makeDetailViewController(id: Int) -> UIViewController {
        let mockVC = UIViewController()
        mockVC.view.backgroundColor = .red
        return mockVC
    }
}
