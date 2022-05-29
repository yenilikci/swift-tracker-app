//
//  Models.swift
//  tracker-app
//
//  Created by Melih Çelik on 29.05.2022.
//

import Foundation

struct Crypto: Codable {
    let asset_id: String
    let name: String
    let price_usd: Float
    let id_icon: String
}
