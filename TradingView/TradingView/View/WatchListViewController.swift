//
//  WatchListViewController.swift
//  TradingView
//
//  Created by Антон Белый on 14.08.2021.
//

import UIKit

// 1. Подгрузить картинки при апдейте ячейки + класс ячейки
// 2. Добавить в JSON добавить флаг (true, false)
// 3. Тики

protocol ViewProtocol: AnyObject {
    var presenter: PresenterProtocol? { get set }
    func updateStocks(with stocks: [Stocks])
    func update(with error: String)
}

class WatchListViewController: UIViewController, ViewProtocol {
    
    var stocks: [Stocks] = []
// MARK: - Protocol
    var presenter: PresenterProtocol?
    
    // TIMER
    var timer: Timer?
    
    func setTimer() {
        self.timer = Timer(timeInterval: 1.0, target: self, selector: #selector(interval), userInfo: nil, repeats: true)
    }
    
    @objc func interval() {
     print("TMER")
    }

    func updateStocks(with stocks: [Stocks]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.stocks = stocks
            self.tableview.reloadData()
            
            
            // обновление ячеек

//            let index = IndexPath(row: 0, section: 0)
//            self.tableview.reloadRows(at: [index], with: .automatic)
        }
    }
    
    func update(with error: String) {
    }
    // TableView
    private let tableview: UITableView = {
        let tableView = UITableView() // перенести в init
        tableView.register(WatchListCell.self, forCellReuseIdentifier: WatchListCell.identifier)
        return tableView
    }()
    
    // BarButton
    
    private let barButton = UIBarButtonItem()
    
    //Search
    
    private func setUpSearchController() {
        let resultVC = WatchListSearch()// перенести в init
        let searchVC = UISearchController(searchResultsController: resultVC)
        navigationItem.searchController = searchVC
    }
    
    //Alert
    
    @objc func didTapAdd() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editButton = UIAlertAction(title: "Редактировать", style: .default)
        let sortedButton = UIAlertAction(title: "Сортировать по", style: .default)
        let cancelButton = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(editButton)
        alert.addAction(sortedButton)
        alert.addAction(cancelButton)

        present(alert, animated: true)
    }

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        view.backgroundColor = .systemBackground
        // Search
        setUpSearchController()
        
        //Title NavVC
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(didTapAdd)), animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Watchlist"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds

    }
    
}

extension WatchListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: WatchListCell.identifier, for: indexPath) as! WatchListCell
        
        

        cell.stockLabel.text = stocks[indexPath.row].name
        cell.stockImage.downloaded(from: stocks[indexPath.row].logo)
        cell.stockSubtitle.text = stocks[indexPath.row].description
        cell.stockPrice.text = String(stocks[indexPath.row].price)
        cell.stockPercentage.text = "+" + String(stocks[indexPath.row].percentage) + "%"

        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
