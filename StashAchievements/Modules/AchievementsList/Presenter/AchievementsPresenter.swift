//
//  AchievementsPresenter.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import Foundation

class AchievementsPresenter: AchievementsListViewToPresenterProtocol {

    // MARK: - Properties
    weak var view: AchievementsListPresenterToViewProtocol?
    var interactor: AchievementsListPresenterToInteractorProtocol?
    var router: AchievementsListPresenterToRouterProtocol?

    // MARK: - Methods
    func fetchAllAchievements() {
        interactor?.fetchAchievements(resource: "achievements")
    }

    func getAchievementsListCount() -> Int? {
        return interactor?.achievements?.count
    }

    func getAchievements(index: Int) -> Achievement? {
        return interactor?.achievements?[index]
    }
}

// MARK: - AchievementsListInteractorToPresenterProtocol
extension AchievementsPresenter: AchievementsListInteractorToPresenterProtocol {

    func AchievementsFetched() {
        view?.showAchievements()
    }

    func AchievementsFetchedFailed() {
        view?.showError()
    }
}
