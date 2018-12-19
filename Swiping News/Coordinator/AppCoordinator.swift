//
//  AppCoordinator.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 18/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow
    var navigationController = UINavigationController()
    
    required init(window: UIWindow) {
        self.window = window
        window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        let vc = SwipingNewsCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController.setViewControllers([vc], animated: true)
    }
}
