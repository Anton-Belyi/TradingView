//
//  WatchListRouter.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

protocol RouterProtocol {

    static func start() -> RouterProtocol
}

class WatchListRouter: RouterProtocol {
    static func start() -> RouterProtocol {
        let router = WatchListRouter()
                
        var view: ViewProtocol = WatchListViewController()
        
        var presenter: PresenterProtocol = WatchListPresenter()
        var interactor: InteractorProtocol = WatchListInteractor()
        
        view.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return router

    }
    
}
