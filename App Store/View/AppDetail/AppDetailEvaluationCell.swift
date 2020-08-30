//
//  AppDetailEvaluationCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 21/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class AppDetailEvaluationCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var app: App? {
        didSet {
            if app != nil {
                self.collectionView.reloadData()
            }
        }
    }
    
    let cellId = "cellId"
    let titleLabel: UILabel = .textBoldLabel(text: "Avaliações e opiniões", fontSize: 24)
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.register(CommentCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(titleLabel)
        titleLabel.preencher(top: topAnchor,
                             leading: leadingAnchor,
                             trailing: trailingAnchor,
                             bottom: nil,
                             padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        addSubview(collectionView)
        collectionView.preencher(top: titleLabel.bottomAnchor,
                                 leading: leadingAnchor,
                                 trailing: trailingAnchor,
                                 bottom: bottomAnchor,
                                 padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app?.comentarios?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CommentCell
        
        if let comentario = self.app?.comentarios?[indexPath.item] {
            cell.comment = comentario
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
    }
}

class CommentCell: UICollectionViewCell {
    
    var comment: AppComentario? {
        didSet {
            if let comment = comment {
                titleLabel.text = comment.titulo
                commentLabel.text = comment.descricao
                evaluationImageView.image = UIImage(named: "avaliacao-\(comment.avaliacao)")
            }
        }
    }
    
    let titleLabel: UILabel = .textBoldLabel(text: "Muito bom", fontSize:  16)
    let commentLabel: UILabel = .textLabel(text: "Recomendo muito esse app..", fontSize: 16, numberOfLines: 0)
    
    let evaluationImageView : UIImageView = {
        let image = UIImageView()
        image.size(size: .init(width: 120, height: 24))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.background
        layer.cornerRadius = 12
        layer.masksToBounds = true
        
        let headerStackView = UIStackView(arrangedSubviews: [titleLabel, evaluationImageView])
        
        let commentStackView = UIStackView(arrangedSubviews: [commentLabel])
        commentStackView.alignment = .top
        
        let stackView = UIStackView(arrangedSubviews: [
            headerStackView,
            commentStackView
        ])
        stackView.axis = .vertical
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.preencherSuperView(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
