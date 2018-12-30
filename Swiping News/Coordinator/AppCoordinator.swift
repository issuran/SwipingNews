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
    
    var newsDetailViewController: NewsDetailViewController!
    var newsDetailViewModel: NewsDetailViewModel!
    
    var swipingNewsCollectionViewController: SwipingNewsCollectionViewController!
    var swipingNewsViewModel: SwipingNewsViewModel!
    
    required init(window: UIWindow) {
        self.window = window
        window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        swipingNewsCollectionViewController = SwipingNewsCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        swipingNewsViewModel = SwipingNewsViewModel(coordinator: self)
        swipingNewsCollectionViewController.start(viewModel: swipingNewsViewModel)
        navigationController.setViewControllers([swipingNewsCollectionViewController], animated: true)
    }
}

extension AppCoordinator: NewsDetailDelegate {
    func callNewsDetail(model: SwipingNewsModel) {
        newsDetailViewModel = NewsDetailViewModel(model: model, coordinator: self)
        newsDetailViewController = NewsDetailViewController(viewModel: newsDetailViewModel)
        navigationController.pushViewController(newsDetailViewController, animated: true)
    }
}
