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
    
    func getStocks() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, error == nil else { return }
            do {
                let entities = try JSONDecoder().decode([Stocks].self, from: data)
                // First load stocks
                self!.presenter?.interactorDidFetchStocks(with: entities)
                
                    DispatchQueue.main.sync {
                    self?.priceСalculation(oldPrice: entities)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
        
    func priceСalculation(oldPrice: [Stocks]) {
        
        var newStocksArray = oldPrice
        
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            RunLoop.current.add(timer, forMode: .common)
            
            let randomChance = Int(arc4random() % 100)
            
            let randomIndex: Int = .random(in: 0..<newStocksArray.count)
            let randomBool = Bool.random()
            let percent = newStocksArray[randomIndex].price * 0.01
            let randomPercentRange = Double.random(in: 0...percent)
            
            switch randomChance {
            case 0..<25:
                switch randomBool {
                case true:
                    newStocksArray[randomIndex].price += randomPercentRange
                default:
                    newStocksArray[randomIndex].price -= randomPercentRange
                }
                for index in 0..<newStocksArray.count {
                    if oldPrice[index].price < newStocksArray[index].price {
                        newStocksArray[index].percentage = (100 * (newStocksArray[index].price - oldPrice[index].price) / oldPrice[index].price)
                        newStocksArray[index].absolute = newStocksArray[index].price - oldPrice[index].price
                        self.presenter?.interactorDidFetchStocks(with: newStocksArray)
                        
                    } else if oldPrice[index].price > newStocksArray[index].price {
                        newStocksArray[index].percentage = -(100 * (oldPrice[index].price - newStocksArray[index].price) / oldPrice[index].price)
                        newStocksArray[index].absolute = newStocksArray[index].price - oldPrice[index].price
                        self.presenter?.interactorDidFetchStocks(with: newStocksArray)
                    }
                }
            case 25..<30:
                if newStocksArray[randomIndex].status == "open" {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                        newStocksArray[randomIndex].status = "closed"
                        self.presenter?.interactorDidFetchStocks(with: newStocksArray)
                        print("111")
                    }
                }
            default:
                break
            }
        }
    }
}
