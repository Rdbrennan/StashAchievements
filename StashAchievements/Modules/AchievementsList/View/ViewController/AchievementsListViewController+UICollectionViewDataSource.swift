//
//  AchievementsListViewController+UICollectionViewDataSource.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/12/21.
//

import Foundation
import UIKit

// MARK: - UICollectionViewDataSource
extension AchievementsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getAchievementsListCount() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementsListCollectionViewCell.cellId,
                                                       for: indexPath) as? AchievementsListCollectionViewCell
        else {
            fatalError("cell misconfiguration")
        }
        let achievement = presenter?.getAchievements(index: indexPath.row)
        cell.achievement = achievement

        return cell
    }
}

