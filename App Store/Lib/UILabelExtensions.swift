//
//  UILabelExtensions.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 17/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

extension UILabel {
     
    static func textLabel(text: String, fontSize: CGFloat, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        label.text = text
        
        return label
    }
    
    static func textBoldLabel(text: String, fontSize: CGFloat, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        label.text = text
        
        return label
    }
}
