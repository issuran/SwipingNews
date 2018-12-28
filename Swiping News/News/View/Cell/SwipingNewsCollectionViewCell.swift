//
//  SwipingNewsCollectionViewCell.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 19/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class SwipingNewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsHeadlineLabel: UILabel!    
    @IBOutlet weak var newsContentView: UIView!
    @IBOutlet weak var newsBriefLabel: UILabel!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with model: SwipingNewsModel) {
        newsImageView.image = model.newsImage
        newsHeadlineLabel.text = model.newsHeadline
        newsBriefLabel.text = model.newsBrief
    }
}
