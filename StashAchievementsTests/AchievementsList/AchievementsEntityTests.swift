//
//  AchievementsEntityTests.swift.swift
//  StashAchievementsTests
//
//  Created by Robert Brennan on 2/12/21.
//

import XCTest
@testable import StashAchievements

class AchievementsModelTests: XCTestCase {

    func testAchievementsSetGet() {
        let achievement = Achievement(id: 3, level: "2", progress: 20, total: 50, bgImageURL: "fakeURL", accessible: true)
        XCTAssertEqual(achievement.id, 3)
        XCTAssertEqual(achievement.level, "2")
        XCTAssertEqual(achievement.progress, 20)
        XCTAssertEqual(achievement.total, 50)
        XCTAssertEqual(achievement.bgImageURL, "fakeURL")
        XCTAssertEqual(achievement.accessible, true)
    }
}
