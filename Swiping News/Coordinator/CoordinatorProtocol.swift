//
//  CoordinatorProtocol.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 18/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
