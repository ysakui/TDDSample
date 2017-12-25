//
//  MainUseCase.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/22.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import Foundation

protocol MainUseCaseInput {
    var repository: ContentRepositoryProtocol? { get set }
    var output: MainUseCaseOutput? { get set }
    
    func fetch()
}

protocol MainUseCaseOutput: NSObjectProtocol {
    func receive(contents: [[Content]])
}

class MainUseCase: MainUseCaseInput {
    
    var repository: ContentRepositoryProtocol?
    weak var output: MainUseCaseOutput?
    
    func fetch() {
        repository?.fetch(completion: { contents in
            output?.receive(contents: contents)
        })
    }
}
