//
//  MainVCFactory.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/23.
//  Copyright © 2017年 ysakui. All rights reserved.
//

struct MainVCFactory {
    static func make(
        mainVC: MainVC = MainVC(),
        presenter: MainPresenterInput = MainPresenter(),
        useCase: MainUseCaseInput = MainUseCase(),
        repository: ContentRepositoryProtocol = ContentRepository()
        ) -> MainVC {
        
        var presenter = presenter
        var useCase = useCase
        
        mainVC.presenter = presenter
        presenter.output = mainVC
        presenter.useCase = useCase
        useCase.repository = repository
        useCase.output = presenter as? MainUseCaseOutput
        
        return mainVC
    }
}
