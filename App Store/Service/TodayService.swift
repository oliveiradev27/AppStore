//
//  TodayService.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 30/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import Foundation

class TodayService {
    
    static let shared = TodayService()
    
    func searchTodayHighlights(completion: @escaping ([TodayApp]?, Error?) -> ()) {
        
        let todayApps: Array<TodayApp> = [
            TodayApp(
                id: 1,
                categoria: "VIAGEM",
                titulo: "Explore o mundo \nsem medo",
                imagemUrl: "destaque-1",
                descricao: "Podemos viajar o mundo em busca da beleza, mas nunca a encontraremos se não a carregarmos dentro de nós.",
                backgroundColor: "#FFFFFF"
            )
        ]
        
        completion(todayApps, nil)
        
    }
}
