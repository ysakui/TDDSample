//
//  MainUseCaseTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/23.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import XCTest
import Nimble
@testable import TDDSample

struct ContentDummy {
    static func make() -> [[Content]] {
        return [
            [
                Content(title: "test-1-1", description: "description"),
                Content(title: "test-1-2", description: "description"),
                Content(title: "test-1-3", description: "description")
            ],
            [
                Content(title: "test-2-1", description: "description"),
                Content(title: "test-2-2", description: "description")
            ],
            [
                Content(title: "test-3-1", description: "description")
            ]
        ]
    }
}

class MainUseCaseSpy: MainUseCase {
    
    var fetch_wasCalled = false
    override func fetch() {
        fetch_wasCalled = true
        
        super.fetch()
    }
}

final class MainUseCaseTests: XCTestCase {
    
    func test_fetch_repositoryのfetchが呼ばれる() {
        let repositorySpy = ContentRepositorySpy()
        let useCaseSpy = MainUseCaseSpy()
        useCaseSpy.repository = repositorySpy
        
        useCaseSpy.fetch()
        
        expect(repositorySpy.fetch_wasCalled).to(beTrue())
    }
}
