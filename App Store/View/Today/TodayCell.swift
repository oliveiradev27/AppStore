//
//  TodayCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 08/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    let categoryLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
    let titleLabel: UILabel = .textLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLines: 2)
    let imageView: UIImageView = .todayImageView(named: "destaque-1")
    let descriptionLabel: UILabel = .textLabel(
        text: "Podemos viajar o mundo em busca de beleza, mas nunca a encontraremos se não a carregarmos dentro de nós.",
        fontSize: 14,
        numberOfLines: 3)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let boxView = UIView()
        boxView.clipsToBounds = true
        boxView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor).isActive = true
        imageView.size(size: .init(width: bounds.width, height: 250))
        
        let stackView = UIStackView(arrangedSubviews: [categoryLabel, titleLabel, boxView, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.preencherSuperView(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
