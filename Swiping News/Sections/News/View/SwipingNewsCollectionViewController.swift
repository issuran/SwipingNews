//
//  SwipingNewsCollectionViewController.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 19/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit
import SkeletonView
import Kingfisher

private let reuseIdentifier = "swipingNewsCell"

class SwipingNewsCollectionViewController: UICollectionViewController,
                                            UICollectionViewDelegateFlowLayout {
    
    var viewModel: SwipingNewsViewModel!
    
    func start(viewModel: SwipingNewsViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "News"
        
        self.collectionView.register(UINib(nibName: "SwipingNewsCollectionViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.backgroundColor = UIColor.white
        
        addSettingsButton()
        setObservables()
        
        viewModel.getTopHeadlines()
    }
    
    func setObservables() {
        viewModel.requestStatus.didChange = { [weak self] status in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if status == .load {
                    self.collectionView.reloadData()
                }
            }
        }
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

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let items = viewModel.topHeadlines?.articles.count else { return 2 }
        return items
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! SwipingNewsCollectionViewCell
        cell.updateShimmer(viewModel.requestStatus.value)
        
        if viewModel.requestStatus.value == .load {
            let test = viewModel.selectedArticle(index: indexPath.row)
            cell.configure(with: test)
        }
        
        return cell
    }
    
    func unwrapStringValues(_ string: String?) -> String {
        guard let unwrappedString = string else {
            return String()
        }
        return unwrappedString
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
        let model = viewModel.selectedArticle(index: indexPath.row)
        
        self.viewModel.callNewsDetail(model: model)
    }
}
