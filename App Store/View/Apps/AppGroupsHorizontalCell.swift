//
//  AppGroupsHorizontalCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 19/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class AppsGroupHorizontalCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let iconImageView: UIImageView = .iconImageView()
    let titleLabel: UILabel = .textLabel(text: "App Label", fontSize: 18,   numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let obtainButton: UIButton = .obtainButton(title: "OBTER", color: UIColor.customBlue)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 80, y: bounds.height, width: bounds.width - 80, height: 0.8)
        bottomLine.backgroundColor = UIColor.customGray.cgColor
        layer.addSublayer(bottomLine)
                
        let companyTitleStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        companyTitleStackView.spacing = 4
        companyTitleStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, companyTitleStackView, obtainButton])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.preencherSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
