//
//  WatchListViewController.swift
//  TradingView
//
//  Created by Антон Белый on 14.08.2021.
//

import UIKit

class WatchListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell")
        return cell
    }
    
    let tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        view.backgroundColor = .systemBackground
        //Делаем большой заголовок
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "WatchList"
    }


}

