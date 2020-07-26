//
//  BaseTabBarViewController.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 16/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class BaseTabBarViewController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hojeViewController = self.createTabItem(viewController: UIViewController(),
                                                    title: "Hoje",
                                                    image: "icone-hoje")
        
        let appsViewController = self.createTabItem(viewController: AppsViewController(),
                                                    title: "Apps",
                                                    image: "icone-apps")
        
        let buscaViewController = self.createTabItem(viewController: BuscaViewController(),
                                                     title: "Busca",
                                                     image: "icone-busca")
        
        viewControllers = [
            hojeViewController,
            appsViewController,
            buscaViewController
        ]
        
        selectedIndex = 1
    }
    
    func createTabItem(viewController: UIViewController, title: String, image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
      
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
        viewController.view.backgroundColor = .white
        
        return navController
    }

}
