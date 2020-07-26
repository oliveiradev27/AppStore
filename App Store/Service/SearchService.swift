//
//  SearchService.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 18/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import UIKit

class SearchService {
    
    static let shared = SearchService()
    
    func searchApps(text: String, completion: @escaping ([App]?, Error?) -> ()) {
        print("SearchService \(text)")
        
        guard let url = URL(string: "https://api.euprogramador.app/app-store/v1/apps?search=\(text)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err  = err {
                print(err)
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode([App].self, from: data)
                print(apps)
                completion(apps, nil)
            } catch let err {
                print(err)
            }
        }.resume()
    }
    
}
