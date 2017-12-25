//
//  ContentCellTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/25.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import XCTest
import Nimble
@testable import TDDSample

final class ContentCellTests: XCTestCase {
    
    var viewModel: ContentCellViewModel!
    var subject: ContentCell!
    
    override func setUp() {
        super.setUp()
        
        self.viewModel = ContentCellViewModel(
            content: Content(
                title: "test-title",
                description: "test-description"
            ),
            section: 2,
            item: 4
        )
        
        self.subject = Bundle.main.loadNibNamed(
            "ContentCell",
            owner: nil,
            options: nil
            )!.first as! ContentCell
    }
    
    func test_setUp_titleLabelが表示され文字列が正しく設定されている() {
        subject.setUp(viewModel: viewModel)
        
        expect(self.subject.findLabel(withText: self.viewModel.mainText))
            .notTo(beNil())
    }
    
    func test_setUp_descriptionLabelが表示され文字列が正しく設定されている() {
        subject.setUp(viewModel: viewModel)
        
        expect(self.subject.findLabel(withText: self.viewModel.subText))
            .notTo(beNil())
    }
    
    func test_setUp_separatorViewが表示されている() {
        subject.setUp(viewModel: viewModel)
        
        expect(self.subject.findView(withView: self.subject.separatorView))
            .to(be(self.subject.separatorView))
    }
}
