//
//  Router.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

typealias EntryPoint = UIViewController

protocol RouterProtocol {
    var entry: EntryPoint?  { get } // Удалить
    static func start() -> RouterProtocol
}

class Router: RouterProtocol {

    var entry: EntryPoint?
    
    static func start() -> RouterProtocol {
        let router = Router()
                
        let view: ViewProtocol = WatchListViewController() // перенести в функцию
        var presenter: PresenterProtocol = Presenter() // перенести в функцию
        var interactor: InteractorProtocol = Interactor() // перенести в функцию
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        interactor.getStocks()
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
    
        router.entry = view as? EntryPoint
        return router

    }
    
}
