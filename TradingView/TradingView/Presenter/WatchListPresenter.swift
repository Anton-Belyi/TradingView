//
//  WatchListPresenter.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

enum FetchError: Error {
    case failed
}

protocol PresenterProtocol {
    var router: RouterProtocol? { get set }
    var interactor: InteractorProtocol? { get set }
    var view: ViewProtocol? { get set }
    func interactorDidFetchWatchListEntity(result: Result<[WatchListEntity], Error>)
}

class WatchListPresenter: PresenterProtocol {
    func interactorDidFetchWatchListEntity(result: Result<[WatchListEntity], Error>) {
    
    }
    
    
    var router: RouterProtocol?
    var interactor: InteractorProtocol?
    var view: ViewProtocol?
    
    init() {
        interactor?.getWatchListEntity()
    }
    
//    func interactorDidFetchWatchListEntity(result: Result<[WatchListEntity], Error>) {
//        switch result {
//        case .success(let stock):
//            view?.updateWatchList(watchList: WatchListEntity)
//        case .failure:
//            view?.update(error: "Wrong")
//        }
//    }
}
