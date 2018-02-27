//
//  ProgressCircleChartModel.swift
//  ProgressChartCircleViewTest
//
//  Created by Luis  Costa on 27/02/18.
//  Copyright © 2018 Luis  Costa. All rights reserved.
//

import UIKit

struct ProgressCircleChartModel {
    var id: Int
    var startPercentage: CGFloat
    var endPercentage: CGFloat
    var color: UIColor
    
    init(id: Int, startPercentage: CGFloat, endPercentage: CGFloat, color: UIColor) {
        self.id = id
        self.startPercentage = startPercentage
        self.endPercentage = endPercentage
        self.color = color
    }
}
