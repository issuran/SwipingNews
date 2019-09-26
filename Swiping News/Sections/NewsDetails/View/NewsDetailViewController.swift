//
//  NewsDetailViewController.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 27/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit
import Kingfisher

class NewsDetailViewController: BaseViewController {
    
    var viewModel: NewsDetailViewModel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsArticle: UILabel!
    @IBOutlet weak var sourceTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    convenience init(viewModel: NewsDetailViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    func start() {
        let imageUrl = URL(string: self.viewModel.model.image)
        imageView.kf.setImage(with: imageUrl)
        titleLabel.text = self.viewModel.model.headline
        newsArticle.text = self.viewModel.model.brief
        sourceTextView.text = self.viewModel.model.url
    }
}
