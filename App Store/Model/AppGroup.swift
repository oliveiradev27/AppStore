//
//  AppGroup.swift
//  App Store
//
//  Created by Leandro de Oliveira Novais on 19/07/20.
//  Copyright © 2020 SpartanLab. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let id : String
    let titulo : String
    let apps: [App]
}
