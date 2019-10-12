//
//  BaseViewController.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 24/09/19.
//  Copyright © 2019 Optimize 7. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    typealias Handler = () -> Void
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    func showToast(message: String) {
        
        let toastLabel = UILabel(frame: CGRect(x: 16, y: 30, width: self.view.frame.width - 32, height: 35))
        toastLabel.backgroundColor = UIColor.AppColors.beautifulDarkRedColor.withAlphaComponent(0.7)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont(name: "HelveticaNeue", size: 12.0)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.3, options: .curveLinear, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
    
    func alert(message: String, title: String = "", completion: @escaping Handler) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
}
