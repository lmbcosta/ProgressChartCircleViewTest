//
//  ViewController.swift
//  ProgressChartCircleViewTest
//
//  Created by Luis  Costa on 27/02/18.
//  Copyright © 2018 Luis  Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI
    @IBOutlet var staticView: UIView!
    @IBOutlet weak var staticCircle: ProgressChartCircleView!
    
    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var animatedCircle: ProgressChartCircleView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // Local vars
    let staticIndex = 0
    let animatedIndex = 1
    var selectedIndex = 0
    let tinnyLightGrey = UIColor.lightGray.withAlphaComponent(0.7)
    
    var models = [
        ProgressCircleChartModel(description: "Carbo Hidrates", startPercentage: 0, endPercentage: 55, color: .green),
        ProgressCircleChartModel(description: "Vitamins", startPercentage: 55, endPercentage: 59, color: .red),
        ProgressCircleChartModel(description: "Proteins", startPercentage: 59, endPercentage: 81, color: .black),
        ProgressCircleChartModel(description: "Fats", startPercentage: 81, endPercentage: 93, color: .red),
        ProgressCircleChartModel(description: "Fiber", startPercentage: 93, endPercentage: 97, color: .orange),
        ProgressCircleChartModel(description: "Minerals", startPercentage: 97, endPercentage: 100, color: .yellow)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        staticView.backgroundColor = .white
        staticView.isHidden = false
        
        animatedView.backgroundColor = .white
        animatedView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Static Circle
        staticCircle.strokeLineWidth = 20
        staticCircle.selectedStrokeColor = .red
        staticCircle.backgroundStrokeColor = tinnyLightGrey
        staticCircle.setModels(models: models)
        staticCircle.labelFont = UIFont.systemFont(ofSize: 52, weight: .medium)
        staticCircle.labelSize = CGSize(width: 138, height: 66)
        
        // Animated Circle
        animatedCircle.strokeLineWidth = 20
        animatedCircle.selectedStrokeColor = .green
        animatedCircle.backgroundStrokeColor = tinnyLightGrey
        animatedCircle.setModels(models: models)
        animatedCircle.labelFont = UIFont.systemFont(ofSize: 50, weight: .medium)
        animatedCircle.labelSize = CGSize(width: 138, height: 66)
        let indexPath = IndexPath(item: 0, section: 0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.top)
        
        staticCircle.animateChartElement(atIndex: 0, animated: false, duration: nil, animationType: nil, counterType: nil)
        
    }
    
    
    @IBAction func segmentTapped(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex {
        case staticIndex:
            animatedView.isHidden = true
            staticView.isHidden = false
            staticCircle.animateChartElement(atIndex: selectedIndex, animated: false, duration: nil, animationType: nil, counterType: nil)
            break
            
        case animatedIndex:
            staticView.isHidden = true
            animatedView.isHidden = false
            animatedCircle.animateChartElement(atIndex: selectedIndex, animated: true, duration: 0.8, animationType: .linear, counterType: .int)
            break
            
        default:
            return
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyTableViewCell
        cell.configureCell(title: model.description, percentage: "\(Int(model.endPercentage - model.startPercentage))%")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        if segmentControl.selectedSegmentIndex == staticIndex {
            staticCircle.animateChartElement(atIndex: indexPath.row, animated: false, duration: nil, animationType: nil, counterType: nil)
        } else {
            animatedCircle.animateChartElement(atIndex: indexPath.row, animated: true, duration: 0.8, animationType: .easeIn, counterType: .int)
        }
    }
    
    
}

