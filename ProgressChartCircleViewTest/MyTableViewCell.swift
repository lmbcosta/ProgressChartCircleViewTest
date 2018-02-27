//
//  MyTableViewCell.swift
//  ProgressChartCircleViewTest
//
//  Created by Luis  Costa on 27/02/18.
//  Copyright © 2018 Luis  Costa. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    // UI
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(title: String, percentage: String) {
        self.titleLabel.text = title
        self.percentageLabel.text = percentage
    }
}
