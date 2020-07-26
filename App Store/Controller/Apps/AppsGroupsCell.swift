//
//  AppsGroupsCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 18/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class AppsGroupsCell: UICollectionViewCell {
    
    var group: AppGroup? {
        didSet {
            if let group = group {
                titleLabel.text = group.titulo
                appsGroupHorizontalViewController.apps = group.apps
            }
        }
    }
    
    let titleLabel: UILabel = .textBoldLabel(text: "app grupo título", fontSize: 24)
    
    let appsGroupHorizontalViewController = AppsGroupHorizontalViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.preencher(top: topAnchor,
                             leading: leadingAnchor,
                             trailing: trailingAnchor,
                             bottom: nil,
                             padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        addSubview(appsGroupHorizontalViewController.view)
        appsGroupHorizontalViewController.view.preencher(top: titleLabel.bottomAnchor,
                                                         leading: leadingAnchor,
                                                         trailing: trailingAnchor,
                                                         bottom: bottomAnchor,
                                                         padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
