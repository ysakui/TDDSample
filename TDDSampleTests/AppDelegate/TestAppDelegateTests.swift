//
//  TestAppDelegateTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/23.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import XCTest
import Nimble
@testable import TDDSample

final class TestAppDelegateTests: XCTestCase {
    
    func test_didFinishLaunchingWithOptions_TestAppDelegateで起動されている() {
        expect(UIApplication.shared.delegate).to(beAKindOf(TestAppDelegate.self))
    }
    
    func test_didFinishLaunchingWithOptions_MainVCを表示することができる() {
        let subject = UIApplication.shared.delegate as! TestAppDelegate
        let navigationVC = UINavigationController(rootViewController: MainVCFactory.make())
        
        subject.window.rootViewController = navigationVC
        subject.window.makeKeyAndVisible()
        
        let rootVC = subject.window.rootViewController
        expect(rootVC).to(beAKindOf(UINavigationController.self))
        expect((rootVC as! UINavigationController).topViewController)
            .to(beAKindOf(MainVC.self))
    }
}
