//
//  MainVC.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/20.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import UIKit

class MainVC: UIViewController, MainPresenterOutput {
    @IBOutlet private(set) weak var collectionView: UICollectionView!
    
    var presenter: MainPresenterInput?
    
    fileprivate var viewModels = [[ContentCellViewModelProtocol]]()
    
    init() {
        super.init(nibName: "MainVC", bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Main"
        
        collectionView.register(ContentCell.self)
        
        presenter?.fetch()
    }
    
    // MARK: - MainPresenterOutput
    func refresh(viewModels: [[ContentCellViewModelProtocol]]) {
        self.viewModels = viewModels
        collectionView.reloadData()
    }
}

extension MainVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewModel = viewModels[indexPath.section][indexPath.item]
        
        let cell: ContentCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setUp(viewModel: viewModel)
        
        return cell
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let viewModel = viewModels[indexPath.section][indexPath.item]
        
        return CGSize(
            width: collectionView.bounds.size.width,
            height: viewModel.cellHeight
        )
    }
}
