//
//  StoryCell.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/11.
//

import UIKit

class StoryCell: UICollectionViewCell {
    
//    static var nib: UINib {
//        UINib(nibName: "StoryCell", bundle: nil)
//    }
    static let identifier = "StoryCell"

    
    @IBOutlet weak var imageView: StoryImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    func setup(storyData: StoryContentData) {
        textLabel.text = storyData.storyName
        imageView.image = storyData.makeImage()
    }
    
}


class StoryImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
    
}
