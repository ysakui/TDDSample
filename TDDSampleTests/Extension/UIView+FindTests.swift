//
//  UIView+FindTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/25.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import UIKit
import XCTest
import Nimble
@testable import TDDSample

class UIViewFindTest: XCTestCase {
    
    func test_findView_viewが存在しない場合に見つけられない() {
        let label = UILabel()
        let view = UIView()
        
        view.addSubview(label)
        
        expect(view.findView(withView: UILabel())).to(beNil())
    }
    
    func test_findView_viewが存在する場合に見つけられる() {
        let label = UILabel()
        let view = UIView()
        
        view.addSubview(label)
        
        expect(view.findView(withView: label)).notTo(beNil())
    }
    
    func test_findLabel_textが一致しない場合にlabelが見つけられない() {
        let label = UILabel()
        let view = UIView()
        
        label.text = "test-label"
        view.addSubview(label)
        
        expect(view.findLabel(withText: "hoge")).to(beNil())
    }
    
    func test_findLabel_textが一致する場合にlabelが見つけられる() {
        let label = UILabel()
        let view = UIView()
        
        label.text = "test-label"
        view.addSubview(label)
        
        expect(view.findLabel(withText: "test-label")).notTo(beNil())
    }
}
