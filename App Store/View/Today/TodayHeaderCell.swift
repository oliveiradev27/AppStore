//
//  TodayHeaderCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 30/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class TodayHeaderCell: UICollectionReusableView {

    let dateLabel : UILabel = .textLabel(text: "DOMINGO, 1 DE MARÇO", fontSize: 14)
  
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hoje"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
        return label
    }()
    
    let perfilImageView: UIImageView = {
        let image = UIImageView()
        image.size(size: .init(width: 36, height: 36))
        image.layer.cornerRadius = 18
        image.clipsToBounds = true
        image.image = UIImage(named: "perfil")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dateLabel)
        dateLabel.preencher(top: topAnchor,
                            leading: leadingAnchor,
                            trailing: nil,
                            bottom: nil,
                            padding: .init(top: 32, left: 24, bottom: 0, right: 0))
        addSubview(titleLabel)
        titleLabel.preencher(top: nil,
        leading: leadingAnchor,
        trailing: nil,
        bottom: bottomAnchor,
        padding: .init(top: 0, left: 24, bottom: 0, right: 0))
        
        addSubview(perfilImageView)
        perfilImageView.preencher(top: nil,
        leading: nil,
        trailing: trailingAnchor,
        bottom: bottomAnchor,
        padding: .init(top: 0, left: 0, bottom: 0, right: 24))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
