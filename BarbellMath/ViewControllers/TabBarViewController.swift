//
//  TabBarViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 11/22/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit
import SwiftUI

class TabBarViewController: UITabBarController {
    // TODO: Remove UIHostingController when SwiftUI migration is complete
    let weightSelectionHostingController = UIHostingController(rootView: WeightSelectionView())
    let previousSearchHostingController = UIHostingController(rootView: PreviousSearchView())

    override func viewDidLoad() {
        super.viewDidLoad()

        weightSelectionHostingController.tabBarItem = UITabBarItem(title: "Load Bar", image: UIImage(systemName: "slider.horizontal.3"), tag: 0)
        previousSearchHostingController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock.arrow.circlepath"), tag: 1)

        viewControllers = [
            weightSelectionHostingController,
            previousSearchHostingController
        ]
    }

}
