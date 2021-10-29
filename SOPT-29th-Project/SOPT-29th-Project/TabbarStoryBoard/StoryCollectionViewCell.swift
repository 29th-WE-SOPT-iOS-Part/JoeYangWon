//
//  FeedCollectionViewCell.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/10/29.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyNameLabel: UILabel!
    
    func collectionViewSetData(storyImage: UIImage?, storyName: String) {
        storyImageView.image = storyImage
        storyNameLabel.text = storyName
    }
}


