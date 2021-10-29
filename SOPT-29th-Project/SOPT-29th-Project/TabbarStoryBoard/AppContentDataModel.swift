//
//  AppContentDataModel.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/10/29.
//

import UIKit

struct AppContentData {
    
    let titleLabel: String
    let subTitleLabel: String
    let thumbnailImage: String
    let profileImage: String
    
    
    func makeThumbnailImageImage() -> UIImage? {
        return UIImage(named: thumbnailImage)
    }

    func makeProfileImageImage() -> UIImage? {
        return UIImage(named: profileImage)
    }
}


struct StoryContentData {
    
    let profileImage: String
    let storyName: String
    
    func makeProfileImageImage() -> UIImage? {
        return UIImage(named: profileImage)
    }

}


