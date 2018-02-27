//
//  ViewController.swift
//  ProgressChartCircleViewTest
//
//  Created by Luis  Costa on 27/02/18.
//  Copyright © 2018 Luis  Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var circleChart: ProgressChartCircleView!
    var index: Int = -1
    var models = [
        ProgressCircleChartModel(id: 1, startPercentage: 0, endPercentage: 72, color: .green),
        ProgressCircleChartModel(id: 2, startPercentage: 72, endPercentage: 80, color: .red),
        ProgressCircleChartModel(id: 3, startPercentage: 80, endPercentage: 83, color: .black),
        ProgressCircleChartModel(id: 4, startPercentage: 83, endPercentage: 89, color: .red),
        ProgressCircleChartModel(id: 5, startPercentage: 89, endPercentage: 93, color: .orange),
        ProgressCircleChartModel(id: 6, startPercentage: 93, endPercentage: 100, color: .yellow)
    ]
    
//    var models = [
//        ProgressCircleChartModel(id: 1, startPercentage: 0, endPercentage: 54, color: .green),
//        ProgressCircleChartModel(id: 2, startPercentage: 54, endPercentage: 72, color: .orange),
//        ProgressCircleChartModel(id: 2, startPercentage: 72, endPercentage: 100, color: .red),
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleChart.strokeLineWidth = 20
        circleChart.selectedStrokeColor = .green
        circleChart.backgroundStrokeColor = .lightGray
        circleChart.setModels(models: models)
        circleChart.labelFont = UIFont.systemFont(ofSize: 52, weight: .medium)
        circleChart.labelSize = CGSize(width: 120, height: 66)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("button Tapped!")
        index += 1
        print("\(index)")
        if index == models.count { index = 0 }
        circleChart.animateChartElement(atIndex: index)
    }
}

