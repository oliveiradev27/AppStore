//
//  BuscaViewController.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 17/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class BuscaViewController: UITableViewController, UISearchBarDelegate {
    
    let cellId = "cellId"
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var apps: [App] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BuscaCell.self, forCellReuseIdentifier: cellId)
        self.configSearchBar()
    }
    
    func configSearchBar() {
        navigationItem.searchController = self.searchController
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "App Store"
        self.searchController.searchBar.delegate = self
    }
    
    func searchBar(_ search: UISearchBar, textDidChange searchText: String) {
        self.searchApps(text: searchText)
    }
}

extension BuscaViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(tableView.bounds.width * 0.8)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BuscaCell
        cell.app = self.apps[indexPath.item]
        return cell
    }
    
    func searchApps(text: String) {
        SearchService.shared.searchApps(text: text) { (apps, err) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.apps = apps
                    self.tableView.reloadData()
                }
            }
            
        }
    }
}
