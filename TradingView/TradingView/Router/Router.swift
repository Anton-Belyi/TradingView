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
                
        let view: ViewProtocol = WatchListViewController()
        var presenter: PresenterProtocol = Presenter()
        var interactor: InteractorProtocol = Interactor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
    
        router.entry = view as? EntryPoint
        return router
    }
}
