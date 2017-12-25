//
//  UICollectionView+RegistableTests.swift
//  TDDSampleTests
//
//  Created by SakuiYoshimitsu on 2017/12/20.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import XCTest
import UIKit
import Nimble
@testable import TDDSample

final class UICollectionViewRegistableTests: XCTestCase {
    
    func test_cellのreuseIdentifierを取得する() {
        expect(TestClassaRegistableCell.reuseIdentifier)
            .to(match("TestClassaRegistableCell"))
    }
    
    func test_registable_ClassRegistableのセルが正しくregisterできる() {
        let subject = TestClassRegistableCollectionViewController()
        
        subject.loadViewIfNeeded()
        
        expect(subject.collectionView(subject.collectionView,
                                      cellForItemAt: IndexPath(item: 0, section: 0)))
            .to(beAKindOf(TestClassaRegistableCell.self))
    }
    
    func test_registable_NibRegistableのセルが正しくregisterできる() {
        let subject = TestNibRegistableCollectionViewController()
        
        subject.loadViewIfNeeded()
        
        expect(subject.collectionView(subject.collectionView,
                                      cellForItemAt: IndexPath(item: 0, section: 0)))
            .to(beAKindOf(ContentCell.self))
    }
}

private class TestableCollectionViewController: UIViewController, UICollectionViewDataSource {
    let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("must be override")
    }
}

private final class TestClassaRegistableCell: UICollectionViewCell, ClassRegistable {}

private final class TestClassRegistableCollectionViewController: TestableCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(TestClassaRegistableCell.self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TestClassaRegistableCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

private final class TestNibRegistableCollectionViewController: TestableCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ContentCell.self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ContentCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
