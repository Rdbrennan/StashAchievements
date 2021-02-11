//
//  AchievementsListViewController.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import UIKit

class AchievementsListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var AchievementsCollectionView: UICollectionView!

    // MARK: - Properties
    var presenter: AchievementsListViewToPresenterProtocol?

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()

        presenter?.updateView()

    }

    private func setUpTableView() {
        AchievementsCollectionView.dataSource = self
        AchievementsCollectionView.delegate = self

        AchievementsCollectionView.register(UINib(nibName: "AchievementsListCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "AchievementsListCollectionViewCell")
    }
}
// MARK: - UITableViewDataSource
extension AchievementsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getAchievementsListCount() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AchievementsListCollectionViewCell", for: indexPath) as? AchievementsListCollectionViewCell
        let row = indexPath.row
        let achievement = presenter?.getAchievements(index: row)
        guard let id = achievement?.id, let level = achievement?.level,
              let progress = achievement?.progress, let total = achievement?.total,
              let imageURL = achievement?.bgImageURL, let accessible = achievement?.accessible else {
            return cell ?? UICollectionViewCell()
        }
        cell?.setCell(title: title, author: author, description: description)
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UITableViewDelegate
extension AchievementsListViewController: UICollectionViewDelegate {}

// MARK: - LiveNewsListPresenterToViewProtocol
extension AchievementsListViewController: AchievementsListPresenterToViewProtocol {

    func showNews() {
        AchievementsCollectionView.reloadData()
    }

    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
