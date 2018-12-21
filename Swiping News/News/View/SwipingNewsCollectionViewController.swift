//
//  SwipingNewsCollectionViewController.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 19/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

private let reuseIdentifier = "swipingNewsCell"

class SwipingNewsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "News"
        
        self.collectionView.register(UINib(nibName: "SwipingNewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.backgroundColor = UIColor.white
    }
    
    func addBackButton() {
        let backButton = UIButton(type: UIButton.ButtonType.custom)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        
        self.navigationItem.hidesBackButton = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @objc func backAction() -> Void {
        let indexPath = collectionView.indexPathsForSelectedItems!
        collectionView.isScrollEnabled = true
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        collectionView.reloadItems(at: indexPath)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SwipingNewsCollectionViewCell
    
        // Configure the cell
        cell.newsImageView.image = #imageLiteral(resourceName: "mega")
        cell.newsHeadlineLabel.text = "Hello World"
        cell.newsBriefLabel.text = "It is a beautiful day to code, isn't it?"
        
        //This creates the shadows and modifies the cards a little bit
        cell.newsContentView.layer.cornerRadius = 5.0
        cell.newsContentView.layer.borderWidth = 1.0
        cell.newsContentView.layer.borderColor = UIColor.clear.cgColor
        cell.newsContentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 0.7
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SwipingNewsCollectionViewCell
        
        cell.superview?.bringSubviewToFront(cell)
        
        guard let navigationBarHeight = navigationController?.navigationBar.bounds.height else {
            return
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions(), animations: ({
            
            self.addBackButton()
            
            let rect = CGRect(
                x: 0,
                y: self.collectionView.contentOffset.y + navigationBarHeight,
                width: self.collectionView.bounds.width,
                height: self.collectionView.bounds.height + navigationBarHeight
            )
            
            cell.frame = rect
            cell.layer.shadowColor = UIColor.white.cgColor
            
            collectionView.isScrollEnabled = false
            
        }), completion: nil)
        
        cell.newsBriefLabel.numberOfLines = 0
        
        cell.newsBriefLabel.text = "It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?It is a beautiful day to code, isn't it2?"
    }
    
}
