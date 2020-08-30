//
//  AppDetailViewController.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 19/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class AppDetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerId"
    let descritionId = "descritionId"
    let screenshotId = "screenshotId"
    let evaluationId = "evaluationId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = .customGray
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    var app : App? {
        didSet {
            let id = app!.id
            searchApp(id: id)
        }
    }
    
    var loading: Bool = true
    
     init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailHeaderCell.self, forCellWithReuseIdentifier: headerId)
        collectionView.register(AppDetailDescritionCell.self, forCellWithReuseIdentifier: descritionId)
        collectionView.register(AppDetailScreenshotCell.self, forCellWithReuseIdentifier: screenshotId)
        collectionView.register(AppDetailEvaluationCell.self, forCellWithReuseIdentifier: evaluationId)

        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralizarSuperView()
    }
    
    func searchApp(id: Int) {
        AppService.shared.searchAppById(id: id) { (app, err) in
            if let app = app {
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.app = app
                    self.loading = false
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.loading ? 1 : 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeaderCell
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descritionId, for: indexPath) as! AppDetailDescritionCell
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotId, for: indexPath) as! AppDetailScreenshotCell
            cell.app = self.app
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: evaluationId, for: indexPath) as! AppDetailEvaluationCell
        cell.app = self.app
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.bounds.width
        var height: CGFloat = 170
        
        if (indexPath.item == 1) {
            let descriptionCell = AppDetailDescritionCell(frame: CGRect(x: 0, y: 0, width: width, height: 1000))
            descriptionCell.app = self.app
            descriptionCell.layoutIfNeeded()
            
            let estimatedHeightCell = descriptionCell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = estimatedHeightCell.height
        }
        
        if indexPath.item == 2 {
            height = 550
        }
        
        if (indexPath.item == 3) {
            height = 280
        }
        
        return .init(width: width, height: height)
    }
}
