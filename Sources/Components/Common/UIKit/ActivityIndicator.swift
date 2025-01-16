//
//  timeProgress.swift
//  sberservice
//
//  Created by admin on 7/19/19.
//  Copyright © 2019 sberbank. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable
class ActivityIndicator: UIView {
    
    let shapeLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.backgroundColor = .clear
            
            let center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
            let circlePath = UIBezierPath(arcCenter: center, radius: 9 , startAngle: -CGFloat.pi / 2, endAngle: 2*CGFloat.pi, clockwise: true)
            self.shapeLayer.path = circlePath.cgPath

            self.shapeLayer.fillColor = UIColor.clear.cgColor
            self.shapeLayer.strokeColor = UIColor.white.cgColor
            self.shapeLayer.strokeEnd = 0

            self.shapeLayer.lineCap = CAShapeLayerLineCap.round
            self.shapeLayer.lineWidth = 2.3

            self.layer.addSublayer(self.shapeLayer)
        }
    }
    
    func start() {

        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 60
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
}

