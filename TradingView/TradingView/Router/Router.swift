//
//  Router.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

protocol MyRouter {
    static func start() -> MyRouter
}

class Router: MyRouter {
    static func start() -> MyRouter {
        let router = Router()
        return router
    }
    
    
}
