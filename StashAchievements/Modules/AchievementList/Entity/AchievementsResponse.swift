//
//  AchievementsResponse.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import Foundation

struct AchievementsResponse: Codable {
    let success: Bool
    let status: Int
    let overview: String
    let achievements: [AchievementsModel]?
}
