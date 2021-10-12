//
//  Presenter.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

protocol PresenterProtocol {
    var router: RouterProtocol? { get set }
    var interactor: InteractorProtocol? { get set }
    var view: ViewProtocol? { get set }
    func interactorDidFetchStocks(with result: [Stocks])
}

class Presenter: PresenterProtocol {
    
    var router: RouterProtocol?
    var interactor: InteractorProtocol? {
        didSet {
            interactor?.getStocks()
        }
    }
    weak var view: ViewProtocol?
    
    func interactorDidFetchStocks(with result: [Stocks]) {
        view?.updateStocks(with: result)
    }
}
