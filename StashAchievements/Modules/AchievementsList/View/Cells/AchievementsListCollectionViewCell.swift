//
//  AchievementsListCollectionViewCell.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import UIKit
import AlamofireImage

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

    var achievement: Achievement? {
        didSet {
            achievementId = achievement?.id
            levelLabel.text = achievement?.level
            if let progress = achievement?.progress,
               let total = achievement?.total{
                progressLabel.text = "\(progress)pts"
                totalLabel.text = "\(total)pts"
            }
            if let url = URL(string: (achievement?.bgImageURL) ?? ""){
                achievementImageView.af_setImage(withURL: url)
            }
            levelView.layer.opacity =  ((achievement?.accessible) ?? false) ? 0.9 : 1.0
            let calculatedProgress = calculateProgress(progress: (achievement?.progress) ?? 0, total: (achievement?.total) ?? 0)
            achievementsProgressView.progress = calculatedProgress
            accessibleOverlay.isHidden = achievement?.accessible ?? false
        }
    }
    
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
        achievementImageView.contentMode = .scaleAspectFill

    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        _ = setupUI
    }

    func calculateProgress(progress: Int, total: Int) -> Float {
        var progressResult = Float()
        progressResult = (Float(progress)/Float(total))
        return progressResult
    }
}
