//
//  FeedContentDataModel.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/11.
//

import UIKit

struct FeedContentData {
    let title: String
    let subTitle: String
    let thumbnailImageName: String
    let profileImageName: String
    
    func makeThumbnailImage() -> UIImage? {
        return UIImage(named: thumbnailImageName)
    }

    func makeProfileImage() -> UIImage? {
        return UIImage(named: profileImageName)
    }
    
    
}



