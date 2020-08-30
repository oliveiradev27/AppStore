//
//  TodayDetailUniqueCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 30/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class TodayDetailUniqueCell: UITableViewCell {
    
    let descritionLabel: UILabel = {
        let label = UILabel()
        let textAttribute = NSMutableAttributedString(
            string: "Example",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]
        )
        
        textAttribute.append(NSAttributedString(
            string: " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec molestie fermentum turpis ullamcorper mattis. Donec ante lorem, dignissim vitae sodales eget, fringilla at lacus. Suspendisse arcu diam, tincidunt a dictum cursus, finibus eu quam. Sed at ornare odio. Nunc tincidunt urna vitae blandit luctus. Ut commodo dapibus venenatis. Proin posuere nunc non mauris sollicitudin convallis. Nunc tempus eget augue at lacinia. Integer fringilla lorem sit amet viverra elementum. Mauris non lacus feugiat, tempus velit a, varius nisl. Donec sed nulla ac felis condimentum aliquam.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]
        ))
        
        label.attributedText = textAttribute
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(descritionLabel)
        descritionLabel.preencherSuperView(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
