//
//  ContentCell.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/25.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell, NibRegistable {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
    func setUp(viewModel: ContentCellViewModelProtocol) {
        mainLabel.text = viewModel.mainText
        subLabel.text = viewModel.subText
    }
}
