//
//  MainVCTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/22.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import XCTest
import Nimble
@testable import TDDSample

final class MainVCSpy: MainVC {
    var viewDidLoad_wasCalled = false
    override func viewDidLoad() {
        viewDidLoad_wasCalled = true
        
        super.viewDidLoad()
    }
    
    var refresh_wasCalled = false
    override func refresh(viewModels: [[ContentCellViewModelProtocol]]) {
        refresh_wasCalled = true
        
        super.refresh(viewModels: viewModels)
    }
}

final class MainVCTests: XCTestCase {
    
    var subject: MainVCSpy!
    var presenter: MainPresenterSpy!
    var viewModels: [[ContentCellViewModelProtocol]]!
    
    override func setUp() {
        super.setUp()
        
        let contents = ContentDummy.make()
        self.viewModels = ContentCellViewModelGenerator.generate(contents: contents)
        
        self.presenter = MainPresenterSpy()
        
        self.subject = MainVCFactory.make(
            mainVC: MainVCSpy(),
            presenter: presenter,
            useCase: MainUseCase(),
            repository: ContentRepositoryStub()
            ) as! MainVCSpy
        
        self.subject.loadViewIfNeeded()
    }
    
    func test_viewDidLoad_ナビゲーションタイトルにMainが表示される() {
        expect(self.subject.title).to(equal("Main"))
    }
    
    func test_viewDidLoad_presenterのfetchが呼ばれてrefreshが呼ばれる() {
        expect(self.subject.viewDidLoad_wasCalled).to(beTrue())
        expect(self.presenter.fetch_wasCalled).to(beTrue())
        expect(self.subject.refresh_wasCalled).to(beTrue())
    }
    
    func test_refresh_コンテンツが正しく表示される() {
        subject.refresh(viewModels: viewModels)
        
        // numberOfSections
        expect(self.subject.numberOfSections(in: self.subject.collectionView))
            .to(equal(viewModels.count))
        
        for (section, models) in viewModels.enumerated() {
            
            // numberOfItemsInSection
            expect(self.subject.collectionView(self.subject.collectionView, numberOfItemsInSection: section))
                .to(equal(models.count))
            
            for (item, viewModel) in models.enumerated() {
                let indexPath = IndexPath(item: item, section: section)
                
                // sizeForItemAt
                expect(self.subject.collectionView(self.subject.collectionView, layout: self.subject.collectionView.collectionViewLayout, sizeForItemAt: indexPath).height)
                    .to(equal(viewModel.cellHeight))
                
                // cellForItemAt
                expect(self.subject.collectionView(self.subject.collectionView, cellForItemAt: indexPath))
                    .to(beAKindOf(ContentCell.self))
            }
        }
    }
}
