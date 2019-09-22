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
    
    var splashViewController: SplashViewController?
    
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
        splashViewController = SplashViewController()
        guard let splashViewController = splashViewController else { return }
        splashViewController.delegate = self
        navigationController.setViewControllers([splashViewController], animated: true)
    }
}

extension AppCoordinator: SplashDelegate {
    func didFinishSplash() {
        swipingNewsCollectionViewController = SwipingNewsCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        swipingNewsViewModel = SwipingNewsViewModel(coordinator: self)
        swipingNewsCollectionViewController.start(viewModel: swipingNewsViewModel)
        navigationController.setViewControllers([swipingNewsCollectionViewController], animated: true)
        splashViewController = nil
    }
}

extension AppCoordinator: NewsDetailDelegate {
    func callNewsDetail(model: SwipingNewsModel) {
        newsDetailViewModel = NewsDetailViewModel(model: model, coordinator: self)
        newsDetailViewController = NewsDetailViewController(viewModel: newsDetailViewModel)
        navigationController.pushViewController(newsDetailViewController, animated: true)
    }
}
