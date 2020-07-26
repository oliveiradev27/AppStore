//
//  BuscaCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 17/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit
import SDWebImage

class BuscaCell: UITableViewCell {
    
    var app : App! {
        didSet {
            titleLabel.text = app.nome
            empresaLabel.text = app.empresa
            
            iconeImageView.sd_setImage(with: URL(string: app.iconeUrl),completed: nil)
            if let screenshotUrls = app.screenshotUrls {
                if screenshotUrls.count > 0 {
                    self.screenshot1ImageView.sd_setImage(with: URL(string: screenshotUrls[0]),
                                                          completed: nil)
                }
                
                if screenshotUrls.count > 1 {
                    self.screenshot2ImageView.sd_setImage(with: URL(string: screenshotUrls[1]),
                                                          completed: nil)
                }
                
                if screenshotUrls.count > 2 {
                    self.screenshot3ImageView.sd_setImage(with: URL(string: screenshotUrls[2]),
                                                          completed: nil)
                }
            }
            
//            DispatchQueue.main.async {
//                if let url = URL(string: self.app.iconeUrl) {
//                    do {
//                        let data = try Data(contentsOf: url)
//                        self.iconeImageView.image = UIImage(data: data)
//                    } catch let err{
//                        print(err)
//                    }
//                }
//            }
        }
    }
    
    let iconeImageView: UIImageView = .iconImageView()
    let titleLabel: UILabel  = .textLabel(text: "App nome", fontSize: 18, numberOfLines: 2)
    let empresaLabel: UILabel = .textLabel(text: "Empresa nome", fontSize: 14)
    let obtainButton: UIButton = .obtainButton(title: "OBTER", color: UIColor.customBlue)
    
    let screenshot1ImageView: UIImageView = .screenshotImageView()
    let screenshot2ImageView: UIImageView = .screenshotImageView()
    let screenshot3ImageView: UIImageView = .screenshotImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let titleEmpresaStackView = UIStackView(arrangedSubviews: [
            titleLabel, empresaLabel
        ])
        
        titleEmpresaStackView.spacing = 8
        titleEmpresaStackView.axis = .vertical
        
        let headerStackView = UIStackView(arrangedSubviews: [
            iconeImageView,
            titleEmpresaStackView,
            obtainButton
        ])
        
        headerStackView.spacing = 12
        headerStackView.alignment = .center
        
        let screenShotStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView,
            screenshot2ImageView,
            screenshot3ImageView
        ])
        
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
        let globalStackView = UIStackView(arrangedSubviews: [
            headerStackView,
            screenShotStackView
        ])
        
        globalStackView.spacing = 16
        globalStackView.axis = .vertical
        
        addSubview(globalStackView)
        globalStackView.preencherSuperView(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
