//
//  Presenter.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

protocol MyPresenter {
    var router: MyRouter { get set }
    var interactor: MyInteractor? { get set }
}

class Presenter {
}
