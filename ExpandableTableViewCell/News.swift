//
//  News.swift
//  ExpandableTableViewCell
//
//  Created by Kam Hei Siu on 7/1/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import UIKit

struct News {
    let fixedHeight: CGFloat
    var height: CGFloat
    var isExpanded: Bool
    let title: String
    let summary: String
    
    init(fixedHeight: CGFloat = 150, height: CGFloat = 150, isExpanded: Bool, title: String, summary: String) {
        self.fixedHeight = fixedHeight
        self.height = height
        self.isExpanded = isExpanded
        self.title = title
        self.summary = summary
    }
}
