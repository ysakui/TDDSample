//
//  ContentCellViewModel.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/25.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import UIKit

protocol ContentCellViewModelProtocol {
    var mainText: String { get }
    var subText: String { get }
    var cellHeight: CGFloat { get }
}

struct ContentCellViewModel: ContentCellViewModelProtocol {
    let mainText: String
    let subText: String
    let cellHeight: CGFloat
    
    init(content: Content, section: Int, item: Int) {
        self.mainText = "mainText: \(content.title)"
        self.subText = "subText: \(content.description) [\(section)-\(item)]"
        self.cellHeight = 50.0
    }
}

struct ContentCellViewModelGenerator {
    static func generate(contents: [[Content]]) -> [[ContentCellViewModelProtocol]] {
        
        var viewModels = [[ContentCellViewModelProtocol]]()
        
        for (section, objects) in contents.enumerated() {
            var models = [ContentCellViewModelProtocol]()
            
            for (item, content) in objects.enumerated() {
                let viewModel = ContentCellViewModel(
                    content: content,
                    section: section,
                    item: item
                )
                models.append(viewModel)
            }
            
            viewModels.append(models)
        }
        
        return viewModels
    }
}
