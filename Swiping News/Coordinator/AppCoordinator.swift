//
//  AppCoordinator.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 18/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SwipingNewsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController.pushViewController(vc, animated: true)
    }
}
