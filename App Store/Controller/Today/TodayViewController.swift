//
//  TodayViewController.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 08/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class TodayViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    var todayApps: [TodayApp] = []
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
        
        self.searchTodayHighlights()
    }
    
    func searchTodayHighlights() {
        TodayService.shared.searchTodayHighlights { (apps, err) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.todayApps = apps
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension TodayViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.todayApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
        
        cell.todayApp = self.todayApps[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: view.bounds.width - 48, height: view.bounds.width + 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            if let frame = cell.superview?.convert(cell.frame, to: nil) {
                tabBarController?.tabBar.isHidden = true
                let modalView = TodayDetailsViewController()
                modalView.modalPresentationStyle = .overCurrentContext
                
                modalView.handlerClose = {
                    self.tabBarController?.tabBar.isHidden = false
                }
                
                self.present(modalView, animated: false) {
                    modalView.frame = frame
                    modalView.todayApp = self.todayApps[indexPath.item]
                    
                }
            }
        }
    }
}
