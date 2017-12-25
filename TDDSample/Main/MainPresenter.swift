//
//  MainPresenter.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/22.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import Foundation

protocol MainPresenterInput {
    var useCase: MainUseCaseInput? { get set }
    var output: MainPresenterOutput? { get set }
    
    func fetch()
}

protocol MainPresenterOutput: NSObjectProtocol {
    func refresh(viewModels: [[ContentCellViewModelProtocol]])
}

class MainPresenter: NSObject, MainPresenterInput, MainUseCaseOutput {
    
    var useCase: MainUseCaseInput?
    weak var output: MainPresenterOutput?
    
    // MARK: - MainPresenterInput
    func fetch() {
        useCase?.fetch()
    }
    
    // MARK: - MainPresenterOutput
    func receive(contents: [[Content]]) {
        let viewModels = ContentCellViewModelGenerator.generate(contents: contents)
        output?.refresh(viewModels: viewModels)
    }
}
