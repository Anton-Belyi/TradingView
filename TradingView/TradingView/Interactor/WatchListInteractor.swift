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
    func getWatchListEntity() {
    
    }
    

    var presenter: PresenterProtocol?
    
    var result: WatchListEntity?
    
    
//    func getWatchListEntity() {
//        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
//        let url = URL(fileURLWithPath: path)
//
//        do {
//            let jsonData = try Data(contentsOf: url)
//            result = try JSONDecoder().decode(WatchListEntity.self, from: jsonData)
//            self.presenter?.interactorDidFetchWatchListEntity(result: .success(<#T##[WatchListEntity]#>))
//        }
//        catch {
//            self.presenter?.interactorDidFetchWatchListEntity(result: .failure(FetchError.failed))
//        }
//
//    }
}
