//
//  AppDetailScreenshotCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 19/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class AppDetailScreenshotCell: UICollectionViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let titleLabel: UILabel = .textBoldLabel(text: "Pré-visualizar", fontSize: 24)
    var collectionView: UICollectionView!
    
    var app: App? {
        didSet {
            if app != nil {
                self.collectionView.reloadData()
            }
        }
    }
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(titleLabel)
        titleLabel.preencher(top: topAnchor,
                             leading: leadingAnchor,
                             trailing: trailingAnchor,
                             bottom: nil,
                             padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        addSubview(collectionView)
        collectionView.preencher(top: titleLabel.bottomAnchor,
                                 leading: leadingAnchor,
                                 trailing: trailingAnchor,
                                 bottom: bottomAnchor,
                                 padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app?.screenshotUrls?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotCell
        
        if let imageUrl = self.app?.screenshotUrls?[indexPath.item] {
            cell.imageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 220, height: collectionView.bounds.height)
    }
}

class ScreenshotCell: UICollectionViewCell {
    
    let imageView: UIImageView = .screenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.preencherSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
