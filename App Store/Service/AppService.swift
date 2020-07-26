//
//  AppService.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 18/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import Foundation

class AppService {
    
    static let shared = AppService()
    
    let API = "https://api.euprogramador.app/app-store/v1/"
    
    func searchFeaturedApps(completion: @escaping ([FeaturedApp]?, Error?) -> ()) {
        guard let url = URL(string: "\(API)apps/apps-em-destaque") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                print(err)
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode([FeaturedApp].self, from: data)
                completion(apps, nil)
            } catch let err {
                completion(nil, err)
                return
            }
            
        }.resume()
    }
    
    func searchGroup(type: String, completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/apps/\(type)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                print(err)
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else {return}
                let app = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(app, nil)
            } catch let err {
                completion(nil, err)
                return
            }
            
        }.resume()
    }
    
    func searchAppById(id: Int, completion: @escaping (App?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/apps/\(id)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                print(err)
                completion(nil, err)
                return
            }
                   
            do {
                guard let data = data else {return}
                let app = try JSONDecoder().decode(App.self, from: data)
                completion(app, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
}
