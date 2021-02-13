//
//  AchievementsInteractor.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import Foundation

class AchievementsInteractor: AchievementsListPresenterToInteractorProtocol {

    // MARK: - Properties
    weak var presenter: AchievementsListInteractorToPresenterProtocol?
    var achievements: [Achievement]?

    // MARK: - Methods
    func fetchAchievements(resource: String) {
        if let path = Bundle.main.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let achievementsResponse = try decoder.decode(AchievementsResponse.self, from: data)
                guard let articles = achievementsResponse.achievements else {
                    self.presenter?.AchievementsFetchedFailed()
                    return
                }
                self.achievements = articles
                self.presenter?.AchievementsFetched()

            } catch let error {
                self.presenter?.AchievementsFetchedFailed()
                print(error)
            }
        }
    }
}
