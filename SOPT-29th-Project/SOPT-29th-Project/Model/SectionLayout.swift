//
//  SectionLayout.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/11.
//

import UIKit


enum SectionLayout: Hashable {
    case storyCarousel
    case filterCarousel
    case feed
}

extension SectionLayout {
    
    func layoutSection(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch self {
            
        case .storyCarousel:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1)))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(70), heightDimension: .estimated(1)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = CGFloat(16)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16)
            section.orthogonalScrollingBehavior = .continuous
            section.supplementariesFollowContentInsets = false
            return section
            
        case .filterCarousel:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1)))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(70), heightDimension: .estimated(1)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = CGFloat(16)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16)
            section.orthogonalScrollingBehavior = .continuous
            section.supplementariesFollowContentInsets = false
            return section
            
        case .feed:
            var feedConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
            feedConfiguration.showsSeparators = true
            feedConfiguration.headerMode = .supplementary
            let feed = NSCollectionLayoutSection.list(using: feedConfiguration, layoutEnvironment: layoutEnvironment)
            return feed
        }
    }
}
