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
    private var newsList = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Expandable Cells"
        
        initNews()
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
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCell.identifier, for: indexPath) as? ExpandableCell else {
            return UITableViewCell()
        }
        
        let news = newsList[indexPath.row]
        cell.configureCell(with: news)
        cell.delegate = self
        
        return cell
    }
}

extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if newsList[indexPath.row].isExpanded {
            return 250
        }
        
        return 150
    }
}

extension FirstViewController: ExpandableCellDelegate {
    func didTapExpandCollapseBtn(cell: ExpandableCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            newsList[indexPath.row].isExpanded = !newsList[indexPath.row].isExpanded
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
}

// MARK: - For News
extension FirstViewController {
    private func initNews() {
        let news1 = News(isExpanded: false, title: "News1", summary: "This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News. End")
        
        let news2 = News(isExpanded: false, title: "News1", summary: "This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News. End")
        
        let news3 = News(isExpanded: false, title: "News1", summary: "This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News. End")
        
        let news4 = News(isExpanded: false, title: "News1", summary: "This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News. End")
        
        let news5 = News(isExpanded: false, title: "News1", summary: "This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News.This is News. End")
        
        newsList.append(news1)
        newsList.append(news2)
        newsList.append(news3)
        newsList.append(news4)
        newsList.append(news5)
    }
}

