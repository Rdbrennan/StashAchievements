//
//  AchievementsListCollectionViewCell.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import UIKit
import AlamoFire

class AchievementsListCollectionViewCell: UICollectionViewCell {

    var id: Int?
    var levelLabel: UILabel!
    var progressLabel: UILabel!
    var totalLabel: UILabel!
    var achievementImageView: UIImageView!
    var accessibleOverlay: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(id: Int, level: String, progress: Int, total: Int, imageURL: String, accessible: Bool) {
        id = id
        levelLabel.text = level
        progressLabel.text = "\(progress)"
        totalLabel.text = "\(total)"
//        alamo
        accessibleOverlay.isHidden = accessible
    }
}
