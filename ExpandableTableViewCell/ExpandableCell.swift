//
//  ExpandableCell.swift
//  ExpandableTableViewCell
//
//  Created by Kam Hei Siu on 7/1/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import UIKit
import SnapKit

class ExpandableCell: UITableViewCell {
    
    static let identifier = "ExpandableCell"
    
    private var titleLabel: UILabel!
    private var summaryLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initVariables()
        setupVariables()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initVariables()
        setupVariables()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initVariables() {
        initTitleLabel()
        initSummaryLabel()
    }
    
    private func setupVariables() {
        setupTitleLabel()
        setupSummaryLabel()
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        self.addSubview(titleLabel)
    }
    
    private func setupTitleLabel() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(20)
        }
        
        titleLabel.backgroundColor = .red
    }
    
    private func initSummaryLabel() {
        summaryLabel = UILabel()
        self.addSubview(summaryLabel)
    }
    
    private func setupSummaryLabel() {
        summaryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.right.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        summaryLabel.backgroundColor = .orange
    }
}
