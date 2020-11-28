//
//  AchievementListInteractor.swift
//  StashCoach
//
//  Created by apple on 11/28/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

class AchievementListInteractor: AchievementListInteractorInputProtocol {
    
    weak var presenter: AchievementListInteractorOutputProtocol?
    
    func retrievePostList() {
        let achievements = AchievementDataManager.shared.getAchievements()
        presenter?.didFetchAchievements(achiementList: achievements)
    }
        
}
