//
//  AppDetailHeaderCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 19/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class AppDetailHeaderCell: UICollectionViewCell {
    
    let iconImageView: UIImageView = .iconImageView(width: 128, height: 128)
    let nameLabel: UILabel = .textLabel(text: "App nome", fontSize: 20, numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let obtainButton: UIButton = .obtainButton(title: "OBTER", color: UIColor.customBlue)
    
    var app: App? {
        didSet {
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                nameLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let buttonStackView = UIStackView(arrangedSubviews: [obtainButton, UIView()])
        
        let titleCompanyStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel, buttonStackView])
        titleCompanyStackView.spacing = 12
        titleCompanyStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleCompanyStackView])
        stackView.alignment = .center
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.preencherSuperView(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
