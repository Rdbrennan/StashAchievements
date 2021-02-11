//
//  AchievementsListCollectionViewCell.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import UIKit
//import AlamoFire

class AchievementsListCollectionViewCell: UICollectionViewCell {
    static var cellId: String = "AchievementsListCollectionViewCell"
    var achievementId: Int?
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var achievementImageView: UIImageView!
    @IBOutlet weak var accessibleOverlay: UIView!
    @IBOutlet var achievementsProgressView: CustomProgressView!
    
    private lazy var setupUI: Void = {
        contentView.layer.cornerRadius = 12.0
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

        levelView.layer.cornerRadius = levelView.frame.width / 2
        levelView.layer.masksToBounds = false

    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        _ = setupUI
    }
    func setCell(id: Int, level: String, progress: Int, total: Int, imageURL: String, accessible: Bool) {
        achievementId = id
        levelLabel.text = level
        progressLabel.text = "\(progress)pts"
        totalLabel.text = "\(total)pts"
//        alamo
        achievementsProgressView.progress = calculateProgress(progress: progress, total: total)
        accessibleOverlay.isHidden = accessible
    }
    func calculateProgress(progress: Int, total: Int) -> Float{
        var progressResult = Float()
        progressResult = (Float(progress)/Float(total))
        return progressResult
    }
}
