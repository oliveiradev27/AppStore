//
//  AppDetailDescritionCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 19/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class AppDetailDescritionCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                descriptionLabel.text = app.descricao
            }
        }
    }
    
    let titleLabel: UILabel = .textBoldLabel(text: "Novidades", fontSize: 24)
    let descriptionLabel: UILabel = .textLabel(text: "Description", fontSize: 12, numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.spacing = 12
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.preencherSuperView(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
