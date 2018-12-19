//
//  AppDelegate.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 16/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        
        coordinator = AppCoordinator(navigationController: navigationController)
        
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
//
//        let navigationController = UINavigationController(rootViewController:  SwipingNewsViewController(collectionViewLayout: UICollectionViewFlowLayout()))
//
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

