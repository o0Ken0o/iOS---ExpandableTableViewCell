//
//  FirstViewController.swift
//  ExpandableTableViewCell
//
//  Created by Kam Hei Siu on 7/1/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Expandable Cells"
        
        initVariables()
        setupVariables()
    }
    
    private func initVariables() {
        initTableView()
    }
    
    private func setupVariables() {
        setupTableView()
    }
    
    private func initTableView() {
        tableView = UITableView()
        self.view.addSubview(tableView)
    }
    
    private func setupTableView() {
        tableView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(self.view.safeAreaLayoutGuide)
            } else {
                make.edges.equalTo(self.view)
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ExpandableCell.classForCoder(), forCellReuseIdentifier: ExpandableCell.identifier)
    }
}

extension FirstViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCell.identifier, for: indexPath) as? ExpandableCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

