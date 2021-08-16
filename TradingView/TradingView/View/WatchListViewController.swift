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
    
    private let tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        view.backgroundColor = .systemBackground
        //Title
        
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
        cell.textLabel?.text = "Cell"
        return cell
    }
}
