//
//  MainPresenterTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/23.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import XCTest
import Nimble
@testable import TDDSample

final class MainPresenterSpy: MainPresenter {
    
    var fetch_wasCalled = false
    override func fetch() {
        fetch_wasCalled = true
        
        super.fetch()
    }
    
    var receive_wasCalled = false
    override func receive(contents: [[Content]]) {
        receive_wasCalled = true
        
        super.receive(contents: contents)
    }
}

final class MainPresenterTests: XCTestCase {
    
    func test_fetch_useCaseのfetchが呼ばれてrefreshが呼ばれる() {
        let presenterSpy = MainPresenterSpy()
        let useCaseSpy = MainUseCaseSpy()
        presenterSpy.useCase = useCaseSpy
        useCaseSpy.repository = ContentRepositorySpy()
        useCaseSpy.output = presenterSpy
        
        presenterSpy.fetch()
        
        expect(presenterSpy.fetch_wasCalled).to(beTrue())
        expect(useCaseSpy.fetch_wasCalled).to(beTrue())
        expect(presenterSpy.receive_wasCalled).to(beTrue())
    }
}
