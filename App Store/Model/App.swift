//
//  App.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 18/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import Foundation

struct App: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let avaliacao: String?
    let iconeUrl: String
    let descricao: String?
    let screenshotUrls: [String]?
    let comentarios: [AppComentario]?
}
