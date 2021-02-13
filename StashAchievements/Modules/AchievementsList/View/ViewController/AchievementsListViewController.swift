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
        presenter?.fetchAllAchievements()
    }
}

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

extension AchievementsListViewController{
    private func setupNavBar()
    {
        title = "Smart Investing"
        navigationController?.navigationBar.barTintColor = UIColor.themePurple()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.white]

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

// MARK: - UICollectionViewDelegate
extension AchievementsListViewController: UICollectionViewDelegate {}

