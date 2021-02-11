//
//  CustomProgressView.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import Foundation
import UIKit

class CustomProgressView: UIProgressView{
    override func layoutSubviews() {
        super.layoutSubviews()

        let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: 4.0)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskLayerPath.cgPath
        layer.mask = maskLayer
    }

}
