//
//  TodayDetailsMultiplesViewController.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 30/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class TodayDetailsMultiplesViewController: UITableViewController {

    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                let header = TodayMultiplesHeaderView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: 145))
                header.todayApp = todayApp
                tableView.tableHeaderView = header
                tableView.reloadData()
            }
        }
    }
    
    let cellId = "cellId"
    
    var handlerClick: ((App) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 24)
        tableView.register(TodayMultiplesAppsCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todayApp?.apps?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodayMultiplesAppsCell
        
        cell.app = self.todayApp?.apps?[indexPath.item]
        cell.leadingConstraint?.constant = 24
        cell.trailingConstraint?.constant = -24
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let app = self.todayApp?.apps?[indexPath.item] {
            self.handlerClick?(app)
        }
    }
}
