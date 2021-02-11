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
        setUpCollectionView()
        setupNavBar()
        presenter?.updateView()

    }
    private func setupNavBar(){
        title = "Smart Investing"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.463628605, green: 0.1680410472, blue: 0.8421655145, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 20), NSAttributedString.Key.foregroundColor: UIColor.white]

        let infoButton = UIButton(type: .infoLight)
        infoButton.tintColor = .white
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: infoButton)]

        let backButton = UIButton(type: .system)
        backButton.setImage(#imageLiteral(resourceName: "backImage"), for: .normal)
        backButton.tintColor = .white
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backButton)]
    }


    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.cellSpacing
        layout.minimumInteritemSpacing = Constants.cellSpacing

        AchievementsCollectionView.setCollectionViewLayout(layout, animated: false)
        AchievementsCollectionView.dataSource = self
        AchievementsCollectionView.delegate = self
        AchievementsCollectionView.showsVerticalScrollIndicator = false
        AchievementsCollectionView.layer.borderColor = UIColor.clear.cgColor
        AchievementsCollectionView.contentInset = UIEdgeInsets(top: 40, left: 10, bottom: 10, right: 10)
        AchievementsCollectionView.register(UINib(nibName: "AchievementsListCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: AchievementsListCollectionViewCell.cellId)
    }
}
// MARK: - UICollectionViewDataSource
extension AchievementsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getAchievementsListCount() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementsListCollectionViewCell.cellId, for: indexPath) as? AchievementsListCollectionViewCell
        let row = indexPath.row
        let achievement = presenter?.getAchievements(index: row)
        guard let id = achievement?.id, let level = achievement?.level,
              let progress = achievement?.progress, let total = achievement?.total,
              let imageURL = achievement?.bgImageURL, let accessible = achievement?.accessible else {
            return cell ?? UICollectionViewCell()
        }
        cell?.setCell(id: id, level: level, progress: progress, total: total, imageURL: imageURL, accessible: accessible)
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension AchievementsListViewController: UICollectionViewDelegate {}

// MARK: - AchievementsListPresenterToViewProtocol
extension AchievementsListViewController: AchievementsListPresenterToViewProtocol {

    func showAchievements() {
        AchievementsCollectionView.reloadData()
    }

    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Achievements", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension AchievementsListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - Constants.cellSpacing * 2)
        return .init(width: width, height: 280)
    }

}
