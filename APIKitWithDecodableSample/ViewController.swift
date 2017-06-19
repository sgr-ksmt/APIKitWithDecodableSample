//
//  ViewController.swift
//  APIKitWithDecodableSample
//
//  Created by SuguruKishimoto on 6/19/17.
//  Copyright © 2017 SuguruKishimoto. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            tableView.dataSource = self
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 100.0
        }
    }
    
    private var repositories: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Session.send(GitHubAPI.SearchRepositories(query: "rxswift")) { [weak self] result in
            switch result {
            case .success(let response):
                self?.repositories = response.items
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        configure(cell, repository: repositories[indexPath.row])
        return cell
    }
    
    private func configure(_ cell: UITableViewCell, repository: Repository) {
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = repository.fullName + "\n" + "\(repository.createdAt)"
    }
}

