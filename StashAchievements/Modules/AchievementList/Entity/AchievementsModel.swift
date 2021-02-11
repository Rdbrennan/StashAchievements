//
//  AchievementsModel.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import Foundation

struct AchievementsModel: Codable {
    let id: Int?
    let level: String?
    let progress, total: Int?
    let bgImageURL: String?
    let accessible: Bool?

    enum CodingKeys: String, CodingKey {
        case id, level, progress, total
        case bgImageURL = "bg_image_url"
        case accessible
    }
}
