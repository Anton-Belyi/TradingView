//
//  Presenter.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

enum FetchError: Error {
    case failed
}

protocol PresenterProtocol {
    var router: RouterProtocol? { get set } //удалить
    var interactor: InteractorProtocol? { get set } //удалить
    var view: ViewProtocol? { get set } //удалить
    func interactorDidFetchStocks(with result: Result<[Stocks], Error>)
}

class Presenter: PresenterProtocol {
    
    var router: RouterProtocol?
    var interactor: InteractorProtocol? {
        didSet {
            interactor?.getStocks()
        }
    }
    weak var view: ViewProtocol?
    
    func interactorDidFetchStocks(with result: Result<[Stocks], Error>) {
        switch result {
        case .success(let stocks):
            view?.updateStocks(with: stocks)
        case .failure:
            view?.update(with: "UPDATE")
        }
    }
    
    
}
