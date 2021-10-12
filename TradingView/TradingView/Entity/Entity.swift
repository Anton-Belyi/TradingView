//
//  Entity.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

struct Stocks: Codable, Hashable {
    let name: String
    let description: String
    var price: Double
    var percentage: Double
    var absolute: Double
    var status: String
    let logo: URL
}

enum StocksCategoriesSection: CaseIterable {
    case allStocks
}

extension Stocks {
    static func ==(lhs: Stocks, rhs: Stocks) -> Bool {
        return lhs.name == rhs.name
    }
}
