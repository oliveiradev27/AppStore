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
        
        var todayApps: Array<TodayApp> = [
            TodayApp(
                id: 1,
                categoria: "VIAGEM",
                titulo: "Explore o mundo \nsem medo",
                imagemUrl: "destaque-1",
                descricao: "Podemos viajar o mundo em busca da beleza, mas nunca a encontraremos se não a carregarmos dentro de nós.",
                backgroundColor: "#FFFFFF",
                apps: nil
            ),
            TodayApp(
                id: 2,
                categoria: "PRATIQUE HOJE",
                titulo: "Mantenha o corpo \ne mente saudáveis",
                imagemUrl: "destaque-2",
                descricao: "Quanto mais se rema, maiores são as chances de pegar as melhores ondas, tanto no surf quanto na vida.",
                backgroundColor: "#69CCE0",
                apps: nil
            )
        ]
        
        AppService.shared.searchApps { (apps, err) in
            if let apps = apps {
                todayApps.append(
                    TodayApp(id: 3, categoria: "A LISTA DO DIA",
                         titulo: "Pedale melhor com \n Apple Watch",
                         imagemUrl: nil,
                         descricao: nil,
                         backgroundColor: nil,
                         apps: apps
                    )
                )
            }
            completion(todayApps, nil)
        }
    }
}
