//
//  FeedTVC.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/10/29.
//

import UIKit

class FeedTVC: UITableViewCell {
    
    static let identifier = "FeedTVC"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var describeLabel: UILabel!
    @IBOutlet weak var subDescribeLabel: UILabel!
    @IBOutlet weak var editBtn: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setData(appData: AppContentData) {
        describeLabel.text = appData.titleLabel
        subDescribeLabel.text = appData.subTitleLabel
        thumbnailImageView.image = appData.makeThumbnailImageImage()
        profileImageView.image = appData.makeProfileImageImage()
    }
    
}
