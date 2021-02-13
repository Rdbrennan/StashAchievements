//
//  AchievementsInteractorTests.swift
//  StashAchievementsTests
//
//  Created by Robert Brennan on 2/12/21.
//

import XCTest
@testable import StashAchievements

class AchievementsInteractorTests: XCTestCase {

    var interactor: AchievementsInteractor!
    var mockPresenter = AchievementsMockPresenter()
    var mockView = AchievementListMockView()

    override func setUp() {
        interactor = AchievementsInteractor()
        interactor.presenter = mockPresenter
      super.setUp()
    }

    override func tearDown() {
        interactor = nil
      super.tearDown()
    }

    func testAchievementsParseError() {
        interactor.fetchAchievements(resource: "fakeAchievements")
        if !mockPresenter.parseFailed {
            XCTFail("parsing error failed")
        }
    }
}

class AchievementsMockPresenter: AchievementsListInteractorToPresenterProtocol{
    func AchievementsFetched() {}
    
    var parseFailed = false
    func AchievementsFetchedFailed() {
        parseFailed = true
    }
}

private struct AchievementsResponse: Codable {
    let success: Bool?
    let overview: Overview?
    let achievements: [Achievement]?
}
