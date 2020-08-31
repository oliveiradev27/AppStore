//
//  TodayDetailsViewController.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 09/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class TodayDetailsViewController: UIViewController {

    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                if (todayApp.apps == nil) {
                    self.addSingle()
                } else {
                    self.addMultiplesApps()
                }
            }
            
        }
    }
    
    let buttonClose: UIButton = UIButton.buildCloseButton()
    
    var centerView: UIView?
    var frame: CGRect?
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    let todayDetailUniqueViewController = TodayDetailsUniqueViewController()
    let todayDetailsMultiplesViewController = TodayDetailsMultiplesViewController()
    
    var handlerClose: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func addbuttonClose() {
        view.addSubview(buttonClose)
        
        buttonClose.alpha = 0
        buttonClose.addTarget(self, action: #selector(handleCloseClick), for: .touchUpInside)
        buttonClose.preencher(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: nil,
                              trailing: view.trailingAnchor,
                              bottom: nil,
                              padding: .init(top: 18, left: 0, bottom: 0, right: 24),
                              size: .init(width: 32, height: 32))
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .showHideTransitionViews, animations: {
            self.buttonClose.alpha = 1
        }, completion: nil)

    }
    
    func addSingle() {
        todayDetailUniqueViewController.todayApp = self.todayApp
        self.centerView = todayDetailUniqueViewController.view
        self.showAnimation()
    }
    
    func addMultiplesApps() {
        self.todayDetailsMultiplesViewController.todayApp = self.todayApp
        self.todayDetailsMultiplesViewController.handlerClick = { app in
            let detailsViewController = AppDetailViewController()
            detailsViewController.title = app.nome
            detailsViewController.app = app
            
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
        self.centerView = todayDetailsMultiplesViewController.view
        showAnimation()
    }
    
    func showAnimation() {
        guard let centerView = self.centerView else {return}
        guard let frame = self.frame else {return}
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.cornerRadius = 16
        centerView.clipsToBounds = true
        view.addSubview(centerView)
        self.addbuttonClose()
        
        self.topConstraint = centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: frame.origin.y)
        self.leadingConstraint = centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: frame.origin.x)
        self.widthConstraint = centerView.widthAnchor.constraint(equalToConstant: frame.width)
        self.heightConstraint = centerView.heightAnchor.constraint(equalToConstant: frame.height)
        
        self.topConstraint?.isActive = true
        self.leadingConstraint?.isActive = true
        self.widthConstraint?.isActive = true
        self.heightConstraint?.isActive = true
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7,options: .overrideInheritedCurve, animations: {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.centerView?.layer.cornerRadius = 0
            self.view.layoutIfNeeded()
        },
        completion: nil)
    }
    
    @objc func handleCloseClick() {
        self.buttonClose.isHidden = true
        self.handlerClose?()
        self.animateClose()
    }
    
    func animateClose() {
        
        self.todayDetailsMultiplesViewController.tableView.setContentOffset(CGPoint(x: 0, y: -self.todayDetailsMultiplesViewController.tableView.safeAreaInsets.top), animated: false)
        
        self.todayDetailsMultiplesViewController.tableView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7 , options: .overrideInheritedCurve, animations: {
            
            if let frame = self.frame {
                self.topConstraint?.constant = frame.origin.y
                self.leadingConstraint?.constant = frame.origin.x
                self.widthConstraint?.constant = frame.width
                self.heightConstraint?.constant = frame.height
                
                self.centerView?.layer.cornerRadius = 16
                self.todayDetailUniqueViewController.tableView.contentOffset = .zero
                self.view.layoutIfNeeded()
            }
            
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}
