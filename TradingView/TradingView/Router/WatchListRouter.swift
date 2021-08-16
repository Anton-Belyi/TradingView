//
//  WatchListRouter.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

typealias EntryPoint = ViewProtocol & UIViewController

protocol RouterProtocol {
    var entry: EntryPoint? { get }
    static func start() -> RouterProtocol
}

class WatchListRouter: RouterProtocol {
    var entry: EntryPoint?
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
        
        router.entry = view as? EntryPoint
        return router

    }
    
}
