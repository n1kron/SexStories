//
//  CollectionViewCell.swift
//  SexStories
//
//  Created by  Kostantin Zarubin on 13/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        blurView.effect = UIBlurEffect(style: .dark)
        blurView.alpha = 0.9
    }
    
    var story: Story? {
        didSet {
            if let story = story {
                backgroundImage.image = story.image
                titleLabel.text = story.storyTitle
                descriptionLabel.text = story.description
                starsImageView.image = story.rating
            }
        }
    }
}

class SettingsTableViewCell: UITableViewCell {
    
}
