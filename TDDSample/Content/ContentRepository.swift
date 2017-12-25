//
//  ContentRepository.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/25.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import Foundation

protocol ContentRepositoryProtocol {
    func fetch(completion: (_ contents: [[Content]]) -> Void)
}

class ContentRepository: ContentRepositoryProtocol {

    func fetch(completion: ([[Content]]) -> Void) {
        var contents = [[Content]]()
        
        // create dummy datas
        for _ in 0..<10 {
            var items = [Content]()
            
            for _ in 0..<10 {
                let content = Content(
                    title: "タイトル",
                    description: "IndexPath ->"
                )
                items.append(content)
            }
            
            contents.append(items)
        }
        
        completion(contents)
    }
}
