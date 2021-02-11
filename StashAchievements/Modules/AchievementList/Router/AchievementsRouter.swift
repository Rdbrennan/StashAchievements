//
//  AchievementsRouter.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import Foundation
import UIKit

class AchievementsRouter: AchievementsListPresenterToRouterProtocol{

    // MARK: - Methods

    class func createModule() -> UIViewController {

        let view = AchievementsListViewController()
        let presenter: AchievementsListViewToPresenterProtocol & AchievementsListInteractorToPresenterProtocol = AchievementsPresenter()
        let interactor: AchievementsListPresentorToInteractorProtocol = AchievementsInteractor()
        let router: AchievementsListPresenterToRouterProtocol = AchievementsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
