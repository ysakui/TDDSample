//
//  ContentRepositoryTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/25.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import XCTest
import Nimble
@testable import TDDSample

final class ContentRepositorySpy: ContentRepositoryProtocol {
    var fetch_wasCalled = false
    func fetch(completion: ([[Content]]) -> Void) {
        fetch_wasCalled = true
        
        completion([[]])
    }
}

final class ContentRepositoryStub: ContentRepositoryProtocol {
    func fetch(completion: ([[Content]]) -> Void) {
        let contents: [[Content]] = [
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
        completion(contents)
    }
}

class ContentRepositoryTests: XCTestCase {
    
    func test_fetch_コンテンツが取得できる() {
        let subject = ContentRepositoryStub()
        
        var contents: [[Content]]?
        
        subject.fetch { responseContents in
            contents = responseContents
        }
        
        expect(contents).toNotEventually(beNil())
        expect(contents).notTo(beEmpty())
    }
}
