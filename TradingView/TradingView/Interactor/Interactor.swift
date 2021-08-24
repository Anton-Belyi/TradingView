//
//  Interactor.swift
//  TradingView
//
//  Created by Антон Белый on 15.08.2021.
//

import UIKit

protocol InteractorProtocol {
    var presenter: PresenterProtocol? { get set }
    func getStocks()
}

class Interactor: InteractorProtocol {

    var presenter: PresenterProtocol?
    
    var result: Stocks?
    
    
    func getStocks() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            self?.presenter?.interactorDidFetchStocks(with: .failure(FetchError.failed))
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let entities = try JSONDecoder().decode([Stocks].self, from: data)
                self?.presenter?.interactorDidFetchStocks(with: .success(entities))

            }
            catch {
                self?.presenter?.interactorDidFetchStocks(with: .failure(error))
            }
        }
        task.resume()
    }
}
