//
//  ExpandableCell.swift
//  ExpandableTableViewCell
//
//  Created by Kam Hei Siu on 7/1/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import UIKit
import SnapKit

protocol ExpandableCellDelegate: class {
    func didTapExpandCollapseBtn(cell: ExpandableCell)
}

class ExpandableCell: UITableViewCell {
    
    static let identifier = "ExpandableCell"
    weak var delegate: ExpandableCellDelegate?
    
    private var titleLabel: UILabel!
    private var expandCollapseButton: UIButton!
    private var summaryLabel: UILabel!
    
    // since we are building the UI using code (with SnapKit), we need to init and setup variables here instead of awakeFromNib()
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
    
    func configureCell(with news: News) {
        titleLabel.text = news.title
        summaryLabel.text = news.summary
    }
    
    private func initVariables() {
        initTitleLabel()
        initExpandCollapseButton()
        initSummaryLabel()
    }
    
    private func setupVariables() {
        setupTitleLabel()
        setupExpandCollapseButton()
        setupSummaryLabel()
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        self.addSubview(titleLabel)
    }
    
    private func setupTitleLabel() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(5)
            make.right.equalTo(expandCollapseButton.snp.left).offset(-5)
            make.height.equalTo(30)
        }
        
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .red
    }
    
    private func initExpandCollapseButton() {
        expandCollapseButton = UIButton()
        self.addSubview(expandCollapseButton)
    }
    
    private func setupExpandCollapseButton() {
        expandCollapseButton.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-5)
        }
        
        expandCollapseButton.setTitle("Expand", for: .normal)
        expandCollapseButton.backgroundColor = .blue
        expandCollapseButton.setTitleColor(.white, for: .normal)
        expandCollapseButton.addTarget(self, action: #selector(expandCollapseButtonTapped(sender:)), for: .touchUpInside)
    }
    
    private func initSummaryLabel() {
        summaryLabel = UILabel()
        self.addSubview(summaryLabel)
    }
    
    private func setupSummaryLabel() {
        summaryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        summaryLabel.textColor = .white
        summaryLabel.numberOfLines = 1000
        summaryLabel.backgroundColor = .orange
    }
    
    @objc private func expandCollapseButtonTapped(sender: UIButton) {
        delegate?.didTapExpandCollapseBtn(cell: self)
    }
}
