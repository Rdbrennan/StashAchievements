//
//  AchievementsProtocols.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import Foundation
import UIKit

protocol AchievementsListPresenterToViewProtocol: class {
    func showAchievements()
    func showError()
}


protocol AchievementsListInteractorToPresenterProtocol: class {
    func AchievementsFetched()
    func AchievementsFetchedFailed()
}

protocol AchievementsListPresentorToInteractorProtocol: class {
    var presenter: AchievementsListInteractorToPresenterProtocol? { get set }
    var achievements: [AchievementsModel]? { get }

    func fetchAchievements()
}

protocol AchievementsListViewToPresenterProtocol: class {
    var view: AchievementsListPresenterToViewProtocol? { get set }
    var interactor: AchievementsListPresentorToInteractorProtocol? { get set }
    var router: AchievementsListPresenterToRouterProtocol? { get set }

    func updateView()
    func getAchievementsListCount() -> Int?
    func getAchievements(index: Int) -> AchievementsModel?
}

protocol AchievementsListPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
