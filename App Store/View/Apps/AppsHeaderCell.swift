//
//  AppsHeaderCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 18/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit
import SDWebImage

class AppsHeaderCell: UICollectionViewCell {
    
    var featuredApp: FeaturedApp? {
        didSet {
            if let featuredApp = featuredApp {
                companyLabel.text = featuredApp.empresa
                descriptionLabel.text = featuredApp.descricao
                imageImageView.sd_setImage(with: URL(string: featuredApp.imagemUrl), completed: nil)
            }
        }
    }
    
    let companyLabel: UILabel = .textLabel(text: "App Empresa", fontSize: 12)
    let descriptionLabel: UILabel = .textLabel(text: "App descrição header", fontSize: 20, numberOfLines: 2)
    let imageImageView: UIImageView = .screenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = UIColor.customBlue
        
        let stackView = UIStackView(arrangedSubviews: [
            companyLabel,
            descriptionLabel,
            imageImageView])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.preencherSuperView(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
   
    required init?(coder: NSCoder) {
        fatalError()
    }
}
