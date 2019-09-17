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
    
    var viewModel: SwipingNewsViewModel!
    
    let imageArray = [
        "mega",
        "dragonball",
        "bleach",
        "naruto",
        "octo"
    ]
    
    let textArray = [
        "MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!MegaMan is a game about this robot boy trying hard to save the whole world from its worst nightmare. Dr. Light is dead and you can upgrade yourself finding capsule left behind for you!",
        "Dragon ball follows Goku on his journey alongside Bulma to find the Dragon Ball which can fulfil their wish to bring back to life Goku's grandfather.",
        "Bleach tells a story about Ichigo which is a shinigami.",
        "Naruto is a ninja not usual trying to become the next Hokage. In his journey he wants to be acknowledge by the others in his Village.",
        "Octopath Traveler is a game based on medieval eras, where you follow 8 travelers, 8 stories, throughout a world full of magic and incredible things."
    ]
    
    let headlineArray = [
        "Mega Man X",
        "Dragon Ball",
        "Bleach",
        "Naruto",
        "Octopath Traveler"
    ]
    
    func start(viewModel: SwipingNewsViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getTopHeadlines()
        
        navigationItem.title = "News"
        
        self.collectionView.register(UINib(nibName: "SwipingNewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.backgroundColor = UIColor.white
        
        addSettingsButton()
    }
    
    func addSettingsButton() {
        let settings = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.settingAction))
        self.navigationItem.rightBarButtonItem = settings
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
        UIView.animate(
            withDuration: 0.7,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: UIView.AnimationOptions(),
            animations: ({
                self.collectionView.isScrollEnabled = true
                self.navigationItem.leftBarButtonItem = nil
                self.navigationItem.hidesBackButton = true
                self.collectionView.reloadItems(at: indexPath)
            }), completion: nil)
    }
    
    @objc func settingAction() -> Void {
        print("Display Settings")
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SwipingNewsCollectionViewCell
    
        // Configure the cell
        cell.newsImageView.image = #imageLiteral(resourceName: imageArray[indexPath.row])
        cell.newsHeadlineLabel.text = headlineArray[indexPath.row]
        cell.newsBriefLabel.text = textArray[indexPath.row]
        
        cell.newsBriefLabel.numberOfLines = 3
        cell.trailingConstraint.constant = 10
        cell.leadingConstraint.constant = 10
        
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
        return CGSize(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let model = SwipingNewsModel(
            newsImage: #imageLiteral(resourceName: imageArray[indexPath.row]),
            newsHeadline: headlineArray[indexPath.row],
            newsBrief: textArray[indexPath.row]
        )
        
        self.viewModel.callNewsDetail(model: model)
        
    }
}
