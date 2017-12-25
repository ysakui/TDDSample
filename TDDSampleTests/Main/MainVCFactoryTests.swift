//
//  MainVCFactoryTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/23.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import XCTest
import Nimble
@testable import TDDSample

final class MainVCFactoryTests: XCTestCase {
    
    func test_make_MainVCの生成時に依存関係が正しく設定されている() {
        let subject = MainVCFactory.make()
        
        expect(subject.presenter).notTo(beNil())
        expect(subject.presenter?.output).notTo(beNil())
        expect(subject.presenter?.useCase).notTo(beNil())
        expect(subject.presenter?.useCase?.repository).notTo(beNil())
        expect(subject.presenter?.useCase?.output).notTo(beNil())
    }
}
