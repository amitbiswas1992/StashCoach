//
//  AchievementListPresenter.swift
//  StashCoach
//
//  Created by Amit Biswas on 11/26/20.
//  Copyright © 2020 Amit Biswas. All rights reserved.
//

import Foundation

class AchievementListPresenter: AchievementListPresenterProtocol {
    
    weak var view: AchievementListViewProtocol?
    var interactor: AchievementListInteractorInputProtocol?
    
    func fetchAchievementsOnLoad() {
        interactor?.retrievePostList()
    }
    
}

extension AchievementListPresenter: AchievementListInteractorOutputProtocol {
    
    func didFetchAchievements(achiementList: AchievementList) {
        view?.showAchievements(achievementsList: achiementList)
    }
    
}

