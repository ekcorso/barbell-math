//
//  TabBarViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 11/22/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    let weightSelectionViewController = WeightSelectionViewController()
    let previousSearchViewController = PreviousSearchViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightSelectionViewController.tabBarItem = UITabBarItem(title: "Load Bar", image: UIImage(systemName: "slider.horizontal.3"), tag: 0)
        previousSearchViewController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock.arrow.circlepath"), tag: 1)
        
        viewControllers = [weightSelectionViewController, previousSearchViewController].map {
            UINavigationController(rootViewController: $0)
        }
    }
}
