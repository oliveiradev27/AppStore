//
//  TodayDetailsUniqueViewController.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 29/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class TodayDetailsUniqueViewController: UITableViewController {
   
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(TodayDetailUniqueCell.self, forCellReuseIdentifier: cellId)
        self.addHeader()
    }
    
    func addHeader() {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))

        let todayCell = TodayCell()
        todayCell.layer.cornerRadius = 0
        headerView.addSubview(todayCell)
        todayCell.preencherSuperView()
        
        self.tableView.tableHeaderView = headerView
    }
}

extension TodayDetailsUniqueViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodayDetailUniqueCell
        return cell
    }
}
