//
//  AchievementProtocols.swift
//  StashCoach
//
//  Created by Amit Biswas on 11/26/20.
//  Copyright © 2020 Amit Biswas. All rights reserved.
//

import Foundation

protocol AchievementListViewProtocol: class {
    var presenter: AchievementListPresenterProtocol? { get set }
    func showAchievements(achievementsList: AchievementList)
}

protocol AchievementListPresenterProtocol: class {
    var view: AchievementListViewProtocol? { get set }
    var interactor: AchievementListInteractorInputProtocol? { get set }
    
    func fetchAchievementsOnLoad()
    
}

protocol AchievementListInteractorInputProtocol: class {
    var presenter: AchievementListInteractorOutputProtocol? { get set }
    
    func retrievePostList()
}

protocol AchievementListInteractorOutputProtocol: class {
    
    func didFetchAchievements(achiementList: AchievementList)
}
