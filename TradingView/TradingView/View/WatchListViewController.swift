//
//  WatchListViewController.swift
//  TradingView
//
//  Created by Антон Белый on 14.08.2021.
//

import UIKit

protocol ViewProtocol: AnyObject {
    var presenter: PresenterProtocol? { get set }
    func updateStocks(with stocks: [Stocks])
}

class WatchListViewController: UIViewController, UITableViewDelegate, ViewProtocol {
    
    var presenter: PresenterProtocol?
    
    private var stocks: [Stocks] = []
    
    func updateStocks(with stocks: [Stocks]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.stocks = stocks
            self.createStockDataSource()
        }
    }
            

    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        tableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Watchlist"
    }
    // MARK: TableView
    
    private var tableView: UITableView!
    
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.register(WatchListCell.self, forCellReuseIdentifier: WatchListCell.identifier)
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: DiffableDataSource
    
    private var dataSource: UITableViewDiffableDataSource<StocksCategoriesSection, Stocks>!
    
    func createStockDataSource() {
        
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, allStocksData -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: WatchListCell.identifier, for: indexPath) as! WatchListCell
            
            cell.stockNameLabel.text = allStocksData.name
            cell.stockImage.loadImageWithUrl(allStocksData.logo)
            cell.stockSubtitle.text = allStocksData.description
            cell.stockPrice.text = "\(String(format: "%.2f", allStocksData.price))"
            
            if allStocksData.status == "closed" {
                cell.stockMarketClosed.text = "Market Closed"
                cell.stockMarketClosed.textColor = .red
                cell.stockMarketClosed.isHidden = false
            } else {
                cell.stockMarketClosed.isHidden = true
            }
            
            switch allStocksData.percentage.sign {
            case .minus:
                cell.stockPercentage.textColor = UIColor(red: 255/255, green: 59/255, blue: 55/255, alpha: 1.0)
                cell.stockAbsolute.textColor = UIColor(red: 255/255, green: 59/255, blue: 55/255, alpha: 1.0)
                cell.stockAbsolute.text = "\(String(format: "%.3f", (allStocksData.absolute)))"
                cell.stockPercentage.text = "\(String(format: "%.2f", (allStocksData.percentage)))%"
                
            default:
                cell.stockPercentage.textColor = UIColor(red: 0/255, green: 136/255, blue: 122/255, alpha: 1.0)
                cell.stockAbsolute.textColor = UIColor(red: 0/255, green: 136/255, blue: 122/255, alpha: 1.0)
                cell.stockAbsolute.text = "+\(String(format: "%.3f", (allStocksData.absolute)))"
                cell.stockPercentage.text = "+\(String(format: "%.2f", (allStocksData.percentage)))%"
            }
            return cell
        })
        updateDataSource()
    }
    
    private func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<StocksCategoriesSection, Stocks>()
        snapshot.appendSections([.allStocks])
        snapshot.appendItems(self.stocks)
        
        dataSource.apply(snapshot)
    }
}

