//
//  +Color.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/12/21.
//

import Foundation
import UIKit

extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func themePurple() -> UIColor {
        return rgb(118, green: 43, blue: 215)
    }
}
