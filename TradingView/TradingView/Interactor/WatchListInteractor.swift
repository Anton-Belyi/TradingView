//
//  WatchListInteractor.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

protocol InteractorProtocol {
    var presenter: PresenterProtocol? { get set }
    func getWatchListEntity()
    
}


class WatchListInteractor: InteractorProtocol {

    var presenter: PresenterProtocol?
    
    func getWatchListEntity() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let jsonData = try Data(contentsOf: url)
        }
        catch {
            print("Error is here: \(error)")
        }

    }
}
