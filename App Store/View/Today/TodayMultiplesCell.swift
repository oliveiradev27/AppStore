//
//  TodayMultiplesCell.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 30/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class TodayMultiplesCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                categoryLabel.text = todayApp.categoria
                titleLabel.text = todayApp.titulo
                tableView.reloadData()
            }
        }
    }
    
    let cellId = "cellId"
    
    let categoryLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
    let titleLabel: UILabel = .textBoldLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLines: 2)
    
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
        
        tableView.register(TodayMultiplesAppsCell.self, forCellReuseIdentifier: cellId)
        
        let stackView = UIStackView(arrangedSubviews: [categoryLabel, titleLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.preencher(top: self.safeAreaLayoutGuide.topAnchor,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            bottom: nil,
                            padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
        addSubview(tableView)
        tableView.preencher(top: stackView.bottomAnchor,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            bottom: bottomAnchor,
                            padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todayApp?.apps?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodayMultiplesAppsCell
        cell.app = todayApp?.apps?[indexPath.item]
        return cell
    }
}
