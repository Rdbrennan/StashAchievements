//
//  AchievementsInteractor.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import Foundation

class AchievementsInteractor: AchievementsListPresentorToInteractorProtocol {


    // MARK: - Properties
    weak var presenter: AchievementsListInteractorToPresenterProtocol?
    var achievements: [AchievementsModel]?

    // MARK: - Methods
    func fetchAchievements() {
        if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                let decoder = JSONDecoder()
                let achievementsResponse = try decoder.decode(AchievementsResponse.self, from: data)
                guard let articles = achievementsResponse.achievements else { return }
                self.achievements = articles
                self.presenter?.liveNewsFetched()
            } catch let error {
                print(error)
            }
        }
    }
}
