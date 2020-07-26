//
//  UIButtonExtension.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 17/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

extension UIButton {
    
    static func obtainButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.size(size: .init(width: 80, height: 32))
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }
}
