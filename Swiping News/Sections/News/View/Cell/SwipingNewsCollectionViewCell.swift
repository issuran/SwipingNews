//
//  SwipingNewsCollectionViewCell.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 19/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit
import SkeletonView
import Kingfisher

class SwipingNewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsHeadlineLabel: UILabel!    
    @IBOutlet weak var newsContentView: UIView!
    @IBOutlet weak var newsBriefLabel: UILabel!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with model: SwipingNewsModel) {
        let imageUrl = URL(string: model.image)
        let processor = DownsamplingImageProcessor(size: newsImageView.frame.size) >> RoundCornerImageProcessor(cornerRadius: 20)
        newsImageView.kf.indicatorType = .activity
        
        newsImageView.kf.setImage(with: imageUrl,
                                  placeholder: #imageLiteral(resourceName: "loading_news_placeholder"),
                                  options: [
                                    .processor(processor),
                                    .scaleFactor(UIScreen.main.scale),
                                    .transition(.fade(1)),
                                    .cacheOriginalImage],
                                  progressBlock: nil)
        
        newsHeadlineLabel.text = model.headline
        newsBriefLabel.text = model.brief
        
        self.newsBriefLabel.numberOfLines = 3
        self.trailingConstraint.constant = 10
        self.leadingConstraint.constant = 10
        
        //This creates the shadows and modifies the cards a little bit
        self.newsContentView.layer.cornerRadius = 5.0
        self.newsContentView.layer.borderWidth = 1.0
        self.newsContentView.layer.borderColor = UIColor.clear.cgColor
        self.newsContentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.7
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
                                             cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    func updateShimmer(_ requestStatus: RequestStatus) {
        if requestStatus == .loading {
            self.newsImageView.clipsToBounds = true
            self.newsImageView.showAnimatedGradientSkeleton()
            self.newsImageView.startSkeletonAnimation()
            
            self.newsBriefLabel.showAnimatedGradientSkeleton()
            self.newsBriefLabel.startSkeletonAnimation()
            
            self.newsHeadlineLabel.showAnimatedGradientSkeleton()
            self.newsHeadlineLabel.startSkeletonAnimation()
        } else if requestStatus == .error || requestStatus == .empty {
            self.newsImageView.stopSkeletonAnimation()
            self.newsBriefLabel.stopSkeletonAnimation()
            self.newsHeadlineLabel.stopSkeletonAnimation()
        } else {
            self.newsImageView.hideSkeleton()
            self.newsImageView.stopSkeletonAnimation()
            
            self.newsBriefLabel.hideSkeleton()
            self.newsBriefLabel.stopSkeletonAnimation()
            
            self.newsHeadlineLabel.hideSkeleton()
            self.newsHeadlineLabel.stopSkeletonAnimation()
        }
    }
}
