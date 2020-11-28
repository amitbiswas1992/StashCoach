//
//  AchievementList.swift
//  StashCoach
//
//  Created by Amit Biswas on 11/26/20.
//  Copyright © 2020 Amit Biswas. All rights reserved.
//

import Foundation


struct AchievementList: Codable {
    
    var success: Bool?
    var status: String?
    var title: String?
    var achievements = [Achievement]()
    var bgImage: String?
    var isAccessible: Bool?

}

//enum CodingKeys: String, CodingKey {
//    case title = "overview.title"
//}
