//
//  ProgressChartCircleView.swift
//  ProgressChartCircleViewTest
//
//  Created by Luis  Costa on 27/02/18.
//  Copyright © 2018 Luis  Costa. All rights reserved.
//

import UIKit

class ProgressChartCircleView: UIView {
    
    public enum LabelTypeAnimation {
        case linear
        case easeIn
        case easeOut
    }
    
    public enum LabelCounterType {
        case int
        case float
    }
    
    fileprivate lazy var _models: [ProgressCircleChartModel] = [ProgressCircleChartModel]()
    fileprivate lazy var _selectedStrokeColor: UIColor = .green
    fileprivate lazy var _backgroundStrokeColor: UIColor = .lightGray
    fileprivate lazy var _radius: CGFloat = self.frame.size.width / 2
    fileprivate var _clockwise: Bool = true
    fileprivate var _label: UILabel!
    fileprivate lazy var _strokeLineWidth: CGFloat = 20
    fileprivate lazy var _labelSize: CGSize = CGSize(width: 200, height: 200)
    fileprivate lazy var _labelFont: UIFont = UIFont.systemFont(ofSize: 80, weight: .medium)
    
    
    // Open Var
    open var selectedStrokeColor: UIColor {
        set { _selectedStrokeColor = newValue }
        get { return _selectedStrokeColor }
    }
    
    open var backgroundStrokeColor: UIColor {
        set { _backgroundStrokeColor = newValue }
        get { return _backgroundStrokeColor }
    }
    
    open var radius: CGFloat {
        set { _radius = newValue }
        get { return _radius }
    }
    
    open var strokeLineWidth: CGFloat {
        set { _strokeLineWidth = newValue }
        get { return _strokeLineWidth }
    }
    
    open var labelSize: CGSize {
        set { _labelSize = newValue }
        get { return _labelSize }
    }
    
    open var labelFont: UIFont {
        set { _labelFont = newValue}
        get { return _labelFont }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Private functions
extension ProgressChartCircleView {}

// MARK: - Public methods
extension ProgressChartCircleView {
    public func setModels(models: [ProgressCircleChartModel]) {
        self._models = models
    }
    
    func animateChartElement(atIndex index: Int) {
        
        self.layer.sublayers?.forEach{$0.removeFromSuperlayer()}
        self.setNeedsDisplay()
        
        
        self._label = UILabel(frame: CGRect(x: 0, y: 0, width: labelSize.width, height: labelSize.height))
        self._label.font = labelFont
        self._label.textColor = selectedStrokeColor
        self.addSubview(_label)
        self._label.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        self._label.textAlignment = .center
        self.layoutIfNeeded()
        
        for i in 0 ..< _models.count {
            
            let centerView = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
            
            let startAnglePercentage = i == index ? _models[i].startPercentage : _models[i].startPercentage + 1
            let endAnglePercentage = i == index ? _models[i].endPercentage : _models[i].endPercentage - 1
            let startAngleRadians = startAnglePercentage * 2 * CGFloat.pi / 100 - (CGFloat.pi / 2)
            let endAngleRadians = endAnglePercentage * 2 * CGFloat.pi / 100 - (CGFloat.pi / 2)
            
            // Circular Path
            let circularPath = UIBezierPath(arcCenter: centerView, radius: radius, startAngle: startAngleRadians, endAngle: endAngleRadians, clockwise: true)
            
            // Contour Layer
            let contourLayer = CAShapeLayer()
            contourLayer.path = circularPath.cgPath
            contourLayer.strokeColor = i == index ? _models[i].color.cgColor : _backgroundStrokeColor.cgColor
            contourLayer.lineWidth = self._strokeLineWidth
            contourLayer.fillColor = UIColor.clear.cgColor
            self.layer.addSublayer(contourLayer)
            
            if i == index {
                _label.textColor = _models[i].color
                layoutIfNeeded()
                _label.text = "\(Int(_models[i].endPercentage - _models[i].startPercentage))%"
            }
        }
    }
    
    func animateChartelement(with id: Int, withAnimation: Bool) {
        // TODO:
    }
}

