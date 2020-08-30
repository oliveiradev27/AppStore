//
//  AppComentario.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 08/08/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import Foundation

struct AppComentario: Decodable {
    let id: Int
    let titulo: String
    let avaliacao: Int
    let descricao: String
}
