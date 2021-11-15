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
    
    var storyContentList: [StoryContentData] = []
    var filterContentList: [FilterContentData] = []
    var feedContentList: [FeedContentData] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setStoryCell()
        registerXib()
        
    }
    
    func setStoryCell() {
        let storyCellXib = UINib(nibName: StoryCell.identifier, bundle: nil)
        storyCollectionView.register(storyCellXib, forCellWithReuseIdentifier: StoryCell.identifier)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self

    }
    
    func registerXib() {
        let xibName = UINib(nibName: FeedTVC.identifier, bundle: nil)
        feedTableView.register(xibName, forCellReuseIdentifier: FeedTVC.identifier)
        feedTableView.delegate = self
        feedTableView.dataSource = self

    }

    private func setData() {
        initAppContentList()
        initFilterContentList()
        initStoryContentList()
    }
    
    func initStoryContentList() {
        storyContentList.append(contentsOf: [
            StoryContentData(storyName: "iOS", storyProfileImageName: "ggamju1"),
            StoryContentData(storyName: "Android", storyProfileImageName: "ggamju2"),
            StoryContentData(storyName: "Plan", storyProfileImageName: "ggamju3"),
            StoryContentData(storyName: "Server", storyProfileImageName: "ggamju4"),
            StoryContentData(storyName: "Design", storyProfileImageName: "ggamju5"),
            StoryContentData(storyName: "KingChoBo", storyProfileImageName: "ggamju6"),
            StoryContentData(storyName: "GoldJanDy", storyProfileImageName: "ggamju7"),
            StoryContentData(storyName: "GodYangang", storyProfileImageName: "ggamju8"),
        ])
    }
    
    func initFilterContentList() {
        filterContentList.append(contentsOf: [
            FilterContentData(filterName: "전체"),
            FilterContentData(filterName: "오늘"),
            FilterContentData(filterName: "이어서 시청하기"),
            FilterContentData(filterName: "시청하지 않음"),
            FilterContentData(filterName: "실시간"),
            FilterContentData(filterName: "게시물"),
            FilterContentData(filterName: "체스"),
            FilterContentData(filterName: "맛있는녀석들"),
            FilterContentData(filterName: "롤"),
            FilterContentData(filterName: "국밥"),
        ])
    }
    
    func initAppContentList() {
        feedContentList.append(contentsOf: [
            FeedContentData(title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환",
                            subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전  ",
                            thumbnailImageName: "wesoptDesignPart",
                            profileImageName: "wesoptProfile"),

            FeedContentData(title: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController",
                            subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전  ",
                            thumbnailImageName: "wesoptDesignPart",
                            profileImageName: "wesoptProfile"),
            FeedContentData(title: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView",
                            subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전  ",
                            thumbnailImageName: "wesoptDesignPart",
                            profileImageName: "wesoptProfile"),
            FeedContentData(title: "4차 iOS 세미나 : Cocoapods & Networking, REST API",
                            subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전  ",
                            thumbnailImageName: "wesoptDesignPart",
                            profileImageName: "wesoptProfile"),
            FeedContentData(title: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ",
                            subTitle: "WE SOPT ・조회수 100만회 ・ 3주 전  ",
                            thumbnailImageName: "wesoptDesignPart",
                            profileImageName: "wesoptProfile"),
            FeedContentData(title: "여기는 잘렸다는...",
                            subTitle: "고로 그냥 암거나 쓴다는... ",
                            thumbnailImageName: "wesoptDesignPart",
                            profileImageName: "wesoptProfile")
        ])
    }
    
    
    
    
    @IBAction func profileIconTapped(_ sender: Any) {
        
  
        let LoginStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let nextVC = LoginStoryBoard.instantiateViewController(withIdentifier: "NavigationController" ) as? UINavigationController else {return}
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)

        
        
//        guard let homeVC = accountStoryboard.instantiateViewController(withIdentifier: "ViewController") as?
//        ViewController else { return }
//
//        homeVC.modalPresentationStyle = .fullScreen
//        self.present(homeVC, animated: true, completion: nil)
    
        
//        guard let nextVC = accountStoryboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
//        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}




extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as? StoryCell else {return UICollectionViewCell()}
            
        cell.setup(storyData: storyContentList[indexPath.row])
        return cell
        
        
    }
}


extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
  
        return UIEdgeInsets(top: 8, left: 13, bottom: 8, right: 13)
    }
}













extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }

}





extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feedContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTVC.identifier) as? FeedTVC else {return UITableViewCell()}
        
//        cell.thumbnailImageView.image = UIImage(named: "wesoptiOSPart")
//        cell.profileImageView.image = UIImage(named: "wesoptProfile")
//        cell.describeLabel.text = feedContentList.description[indexPath.row]
//        cell.subDescribeLabel.text = feedContentList.subde

        cell.setData(appData: feedContentList[indexPath.row])
        return cell

    }
    
    
}
