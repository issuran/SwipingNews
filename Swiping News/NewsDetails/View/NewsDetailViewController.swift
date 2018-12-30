//
//  NewsDetailViewController.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 27/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var viewModel: NewsDetailViewModel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsArticle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    convenience init(viewModel: NewsDetailViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    func start() {
        imageView.image = self.viewModel.model.newsImage
        titleLabel.text = self.viewModel.model.newsHeadline
        newsArticle.text = self.viewModel.model.newsBrief
    }
}
