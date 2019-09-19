//
//  SplashViewController.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 17/09/19.
//  Copyright © 2019 Optimize 7. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    @IBOutlet weak var animationContainerView: LottieView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var delegate: SplashDelegate!
    
    let animation = Animation.named("swipping-news-logo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        titleLabel.alpha = 0
        authorLabel.alpha = 0
        
        UIView.animate(withDuration: 2.5,
                       delay: 1.5,
                       options: .transitionCurlDown,
                       animations: {
                        self.titleLabel.isHidden = false
                        self.authorLabel.isHidden = false
                        self.titleLabel.alpha = 1
                        self.authorLabel.alpha = 1
        }, completion: nil)
        
        let animationView = AnimationView(animation: animation)
        animationView.frame = CGRect(x: 0, y: 0,
                                     width: animationContainerView.frame.width,
                                     height: animationContainerView.frame.height)
        animationView.clipsToBounds = true
        animationView.animationSpeed = 0.5
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationContainerView.addSubview(animationView)
        
        animationView.play { (done) in
            self.delegate.didFinishSplash()
        }
    }
}
