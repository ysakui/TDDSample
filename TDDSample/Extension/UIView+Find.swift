//
//  UIView+Find.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/25.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import UIKit

extension UIView {
    
    func findLabel(withText searchText: String) -> UILabel? {
        return subviews
            .flatMap { $0 as? UILabel ?? $0.findLabel(withText: searchText) }
            .filter { $0.text == searchText }
            .first
    }
    
    func findView(withView searchView: UIView) -> UIView? {
        return subviews
            .flatMap { $0 === searchView ? $0 : $0.findView(withView: searchView) }
            .first
    }
}
