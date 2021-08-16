//
//  WatchListPresenter.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

protocol PresenterProtocol {
    var router: RouterProtocol? { get set }
    var interactor: InteractorProtocol? { get set }
    var view: ViewProtocol? { get set }
    func interactorDidFetchWatchListEntity(result: Result<[WatchListEntity], Error>)
}

class WatchListPresenter: PresenterProtocol {
    
    var router: RouterProtocol?
    var interactor: InteractorProtocol?
    var view: ViewProtocol?
    
    func interactorDidFetchWatchListEntity(result: Result<[WatchListEntity], Error>) {
    }

    init() {
        interactor?.getWatchListEntity()
    }
    
}
