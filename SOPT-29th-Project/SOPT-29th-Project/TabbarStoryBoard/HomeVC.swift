//
//  HomeVC.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/10/21.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    var appContentList: [AppContentData] = []
    var storyContentList: [StoryContentData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAppContentList()
        initStoryContentList() 
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        registerXib()
//        registerCollectionViewXib()
        
//        storyCollectionView.register(storyCollectionView.self, forCellWithReuseIdentifier: "StoryCollectionViewCell")
    }
    
    func registerXib() {
        let xibName = UINib(nibName: FeedTVC.identifier, bundle: nil)
        feedTableView.register(xibName, forCellReuseIdentifier: FeedTVC.identifier)
    }

//    func registerCollectionViewXib() {
//        let xibName = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
//        storyCollectionView.register(xibName, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
//    }
    
    
    func initStoryContentList() {
        storyContentList.append(contentsOf: [
            StoryContentData(profileImage: "ggamju1", storyName: "iOS"),
            StoryContentData(profileImage: "ggamju2", storyName: "Android"),
            StoryContentData(profileImage: "ggamju3", storyName: "Plan"),
            StoryContentData(profileImage: "ggamju4", storyName: "Server"),
            StoryContentData(profileImage: "ggamju5", storyName: "Design"),
            StoryContentData(profileImage: "ggamju6", storyName: "KingChoBo"),
            StoryContentData(profileImage: "ggamju7", storyName: "GoldJanDy"),
            StoryContentData(profileImage: "ggamju8", storyName: "GodYangang"),
        ])
        
    }
    
    
    
    func initAppContentList() {
        appContentList.append(contentsOf: [
            AppContentData(titleLabel: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subTitleLabel: "WE SOPT ・조회수 100만회 ・ 3주 전  ", thumbnailImage: "wesoptDesignPart", profileImage: "wesoptProfile"),
            AppContentData(titleLabel: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", subTitleLabel: "WE SOPT ・조회수 100만회 ・ 3주 전  ", thumbnailImage: "wesoptDesignPart", profileImage: "wesoptProfile"),
            AppContentData(titleLabel: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", subTitleLabel: "WE SOPT ・조회수 100만회 ・ 3주 전  ", thumbnailImage: "wesoptDesignPart", profileImage: "wesoptProfile"),
            AppContentData(titleLabel: "4차 iOS 세미나 : Cocoapods & Networking, REST API", subTitleLabel: "WE SOPT ・조회수 100만회 ・ 3주 전  ", thumbnailImage: "wesoptDesignPart", profileImage: "wesoptProfile"),
            AppContentData(titleLabel: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", subTitleLabel: "WE SOPT ・조회수 100만회 ・ 3주 전  ", thumbnailImage: "wesoptDesignPart", profileImage: "wesoptProfile"),
            AppContentData(titleLabel: "여기는 잘렸다는...", subTitleLabel: "고로 그냥 암거나 쓴다는... ", thumbnailImage: "wesoptDesignPart", profileImage: "wesoptProfile")
        ])
    }


}


extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storyContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else{return UICollectionViewCell() }
        
        
        cell.collectionViewSetData(storyImage: storyContentList[indexPath.row].makeProfileImageImage(),
                                   storyName: storyContentList[indexPath.row].storyName)

        return cell
    }
    
    
}

extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}













extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTVC.identifier) as? FeedTVC else { return UITableViewCell() }
        
        cell.setData(appData: appContentList[indexPath.row])
        return cell
    }
    
    
}



extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}
