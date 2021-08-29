//
//  Entity.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

struct Stocks: Codable {
    let name: String
    let description: String
    var price: Double
    let percentage: Double
//    let absolute: String
//    let status: String
    let logo: String
}
