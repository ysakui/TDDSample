//
//  ContentCellViewModelTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/25.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import XCTest
import Nimble
@testable import TDDSample

final class ContentCellViewModelTests: XCTestCase {
    
    var subject: ContentCellViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.subject = ContentCellViewModel(
            content: Content(
                title: "title",
                description: "description"
            ),
            section: 2,
            item: 3
        )
    }
    
    func test_init_mainTextが正しく初期化されている() {
        expect(self.subject.mainText).to(equal("mainText: title"))
    }
    
    func test_init_subTextが正しく初期化されている() {
        expect(self.subject.subText).to(equal("subText: description [2-3]"))
    }
    
    func test_init_cellHeightが正しく初期化されている() {
        expect(self.subject.cellHeight).to(equal(50.0))
    }
}
