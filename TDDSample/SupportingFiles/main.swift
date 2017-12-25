//
//  main.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/23.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import UIKit

let isUnitTestRunning = !(ProcessInfo.processInfo.environment["isUnitTestScheme"]?.isEmpty ?? true)

if isUnitTestRunning {
    UIApplicationMain(CommandLine.argc,
                      UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(
                        to: UnsafeMutablePointer<Int8>.self,
                        capacity: Int(CommandLine.argc)),
                      NSStringFromClass(UIApplication.self),
                      NSStringFromClass(TestAppDelegate.self))
    
} else {
    UIApplicationMain(CommandLine.argc,
                      UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(
                        to: UnsafeMutablePointer<Int8>.self,
                        capacity: Int(CommandLine.argc)),
                      NSStringFromClass(UIApplication.self),
                      NSStringFromClass(AppDelegate.self))
}
