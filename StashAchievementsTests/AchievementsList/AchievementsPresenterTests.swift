//
//  AchievementsPresenterTests.swift
//  StashAchievementsTests
//
//  Created by Robert Brennan on 2/12/21.
//

import XCTest
@testable import StashAchievements

class AchievementsPresenterTests: XCTestCase {
    
    var presenter: AchievementsPresenter!
    var mockView = AchievementListMockView()
    var mockInteractor = AchievementListMockInteractor()

    override func setUp() {
        presenter = AchievementsPresenter()
        presenter?.view = mockView
        presenter?.interactor = mockInteractor
        mockInteractor.presenter = presenter
      super.setUp()
    }

    override func tearDown() {
        presenter = nil
    }

    func testViewShownOnFetchAchievementsSuccess() {
        presenter.fetchAllAchievements()
        if !mockView.isAchievementsParsed {
            XCTFail("showAchievements func not called")
        }
    }
}

class AchievementListMockView: AchievementsListPresenterToViewProtocol {
    var isAchievementsParsed = false

    var achievementList:[Achievement]?
    func showAchievements() {
        isAchievementsParsed = true
    }

    func showError() {

    }
}

class AchievementListMockInteractor: AchievementsListPresenterToInteractorProtocol {



    var presenter: AchievementsListInteractorToPresenterProtocol?
    var achievements: [Achievement]?

    func fetchAchievements(resource: String) {
        presenter?.AchievementsFetched()
    }
}
