//
//  FeedCell.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/11.
//

import UIKit

class FeedCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var optionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(feedData: FeedContentData) {
        titleLabel.text = feedData.title
        subTitleLabel.text = feedData.subTitle
        thumbnailImageView.image = feedData.makeThumbnailImage()
        profileImageView.image = feedData.makeProfileImage()
    }
    
    
    
}
