//
//  TodayMultiplesAppsCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 30/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class TodayMultiplesAppsCell: UITableViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let iconImageView: UIImageView = .iconImageView(width: 48, height: 48)
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 16)
    let companyLabel: UILabel = .textLabel(text: "App empresas", fontSize: 14)
    let obtainButton: UIButton = .obtainButton(title: "OBTER", color: UIColor.customBlue)
    
    var leadingConstraint: NSLayoutConstraint?
    var trailingConstraint : NSLayoutConstraint?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        
        let companyStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        companyStackView.spacing = 4
        companyStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, companyStackView, obtainButton])
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.preencher(top: topAnchor,
                            leading: nil,
                            trailing: nil,
                            bottom: bottomAnchor,
                            padding: .init(top: 14, left: 0, bottom: 14, right: 0))
        
        self.leadingConstraint = stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        self.trailingConstraint = stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        
        self.leadingConstraint?.isActive = true
        self.trailingConstraint?.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
