//
//  StoryContentDataModel.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/11.
//

import UIKit

struct StoryContentData {
    let storyName: String
    let storyProfileImageName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: storyProfileImageName)
    }
}


