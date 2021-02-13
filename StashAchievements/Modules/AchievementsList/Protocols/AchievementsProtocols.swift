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

protocol AchievementsListPresenterToInteractorProtocol: class {
    var presenter: AchievementsListInteractorToPresenterProtocol? { get set }
    var achievements: [Achievement]? { get }
    func fetchAchievements(resource: String) 
}

protocol AchievementsListViewToPresenterProtocol: class {
    var view: AchievementsListPresenterToViewProtocol? { get set }
    var interactor: AchievementsListPresenterToInteractorProtocol? { get set }
    var router: AchievementsListPresenterToRouterProtocol? { get set }

    func fetchAllAchievements()
    func getAchievementsListCount() -> Int?
    func getAchievements(index: Int) -> Achievement?
}

protocol AchievementsListPresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
