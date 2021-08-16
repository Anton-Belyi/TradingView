//
//  WatchListEntity.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

struct WatchListEntity: Codable {
    let data: [ResultItems]
}

struct ResultItems: Codable {
    let name: String
    let description: String
    let price: String
    let percentage: String
    let absolute: String
    let logo: String
}
