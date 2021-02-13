//
//  AchievementsListViewController+UICollectionViewDelegateFlowLayout.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/12/21.
//

import Foundation
import UIKit

extension AchievementsListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - Constants.cellSpacing * 2)
        return .init(width: width, height: 280)
    }
}
