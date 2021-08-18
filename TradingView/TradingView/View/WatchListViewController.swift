//
//  WatchListViewController.swift
//  TradingView
//
//  Created by Антон Белый on 14.08.2021.
//

import UIKit

protocol ViewProtocol {
    var presenter: PresenterProtocol? { get set }
    func updateWatchList(watchList: [WatchListEntity])
    func update(error: String)
}

class WatchListViewController: UIViewController, ViewProtocol {
// MARK: - Protocol
    var presenter: PresenterProtocol?
    
    
    
    func updateWatchList(watchList: [WatchListEntity]) {
        
    }
    
    func update(error: String) {
        
    }
    // TableView
    private let tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // BarButton
    
    private let barButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        return barButton
    }()
    
    //Search
    
    private func setUpSearchController() {
        let resultVC = WatchListSearch()
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
        title = "WatchList"

        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
}

extension WatchListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Stock exchange"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
