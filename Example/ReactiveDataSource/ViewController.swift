//
//  ViewController.swift
//  ReactiveDataSource
//
//  Created by Tulipa on 11/07/2016.
//  Copyright (c) 2016 Tulipa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    let viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = viewModel
        
        collectionView.backgroundColor = UIColor.white
        
        view.addSubview(collectionView)
        MyCell.register(for: collectionView)
        viewModel.delegate = collectionView
        
        viewModel.refresh()
    }

}

