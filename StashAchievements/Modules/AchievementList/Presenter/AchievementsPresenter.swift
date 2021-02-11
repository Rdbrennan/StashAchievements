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
    var interactor: AchievementsListPresentorToInteractorProtocol?
    var router: AchievementsListPresenterToRouterProtocol?

    // MARK: - Methods
    func updateView() {
        interactor?.fetchAchievements()
    }

    func getAchievementsListCount() -> Int? {
        return interactor?.achievements?.count
    }

    func getAchievements(index: Int) -> AchievementsModel? {
        return interactor?.achievements?[index]
    }
}

// MARK: - LiveNewsListInteractorToPresenterProtocol
extension AchievementsPresenter: AchievementsListInteractorToPresenterProtocol {

    func liveNewsFetched() {
        view?.showNews()
    }

    func liveNewsFetchedFailed() {
        view?.showError()
    }
}
