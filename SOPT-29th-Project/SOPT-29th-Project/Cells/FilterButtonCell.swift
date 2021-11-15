//
//  FillterButtonCell.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/11.
//

import UIKit

class FilterButtonCell: UICollectionViewCell {

    @IBOutlet weak var filterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(filterData: FilterContentData) {
        filterLabel.text = filterData.filterName
    }


}
