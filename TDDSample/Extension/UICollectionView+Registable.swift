//
//  UICollectionView+Registable.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/20.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import UIKit

protocol Registable {
    static var reuseIdentifier: String { get }
}

extension Registable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol ClassRegistable: Registable {}

protocol NibRegistable: Registable {
    static var nib: UINib { get }
}

extension NibRegistable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: .main)
    }
}

// https://qiita.com/gonsee/items/9ab89581996ad950b436#registrable%E3%83%97%E3%83%AD%E3%83%88%E3%82%B3%E3%83%AB
extension UICollectionView {
    func register<T: Registable>(_ registableType: T.Type) where T: UICollectionViewCell {
        switch registableType {
        case let nibRegistableType as NibRegistable.Type:
            register(nibRegistableType.nib,
                     forCellWithReuseIdentifier: nibRegistableType.reuseIdentifier)
        case let classRegistableType as ClassRegistable.Type:
            register((classRegistableType as! AnyClass),
                     forCellWithReuseIdentifier: classRegistableType.reuseIdentifier)
        default:
            fatalError("\(registableType) is unknown type")
        }
    }
    
    func dequeueReusableCell<T: Registable>(for indexPath: IndexPath) -> T where T: UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with type \(T.self)")
        }
        
        return cell
    }
}
