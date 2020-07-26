//
//  AppsViewController.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 18/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class AppsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    let headerId = "headerId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = UIColor.customGray
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    var featuredApps: [FeaturedApp] = []
    var appGroups: [AppGroup] = []

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralizarSuperView()
        
        self.searchApps()
    }
}

extension AppsViewController {
    
    func searchApps() {
        var featuredApps: [FeaturedApp]?
        var appsWeLove: AppGroup?
        var freeApps: AppGroup?
        var topPayApps: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        AppService.shared.searchFeaturedApps { (apps, err) in
            featuredApps = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        AppService.shared.searchGroup(type: "apps-que-amamos") { (group, err) in
            appsWeLove = group
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        AppService.shared.searchGroup(type: "top-apps-gratis") { (group, err) in
            freeApps = group
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        AppService.shared.searchGroup(type: "top-apps-pagos") { (group, err) in
            topPayApps = group
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            if let featuredApps = featuredApps {
                self.featuredApps = featuredApps
            }
            
            if let appsWeLove = appsWeLove {
                self.appGroups.append(appsWeLove)
            }
            
            if let topFreeApps = freeApps{
                self.appGroups.append(topFreeApps)
            }
            
            if let topPayApps = topPayApps {
                self.appGroups.append(topPayApps)
            }
            
            self.activityIndicatorView.stopAnimating()
            self.collectionView.reloadData()
        }
    }
}

extension AppsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeader
        header.featuredApps = self.featuredApps
        header.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appGroups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupsCell
        cell.group = self.appGroups[indexPath.item]
        cell.appsGroupHorizontalViewController.callback = { app in
            let appDetailsViewController = AppDetailViewController()
            appDetailsViewController.app = app
            self.navigationController?.pushViewController(appDetailsViewController, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: 280)
    }
}
