//
//  AchievementDataManager.swift
//  StashCoach
//
//  Created by Amit Biswas on 11/26/20.
//  Copyright © 2020 Amit Biswas. All rights reserved.
//

import Foundation

class AchievementDataManager {
    
    static let shared = AchievementDataManager()
    
    private init() {}
    
    func getAchievements() -> AchievementList {
        if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
            do {
                var achievementList = AchievementList()
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                    
                    if let overView = jsonResult["overview"] as? [String: Any], let title = overView["title"] as? String {
                        achievementList.title = title
                    }
                    
                    if let parsedJsonAchievements = jsonResult["achievements"] as? [Any] {
                        parsedJsonAchievements.forEach { achievement in
                            
                            if let jsonArray = achievement as? [String:Any] {
                                var newAchievement = Achievement()
                                newAchievement.id = jsonArray["id"] as? Int
                                newAchievement.bgImage = jsonArray["bg_image_url"] as? String
                                newAchievement.level = jsonArray["level"] as? String
                                newAchievement.total = jsonArray["total"] as? Int
                                newAchievement.progress = jsonArray["progress"] as? Int
                                newAchievement.accessible = jsonArray["accessible"] as? Bool
                                
                                achievementList.achievements.append(newAchievement)
                            }
                        }
                    }
                }
                
                return achievementList
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return AchievementList()
    }
    
}
