//
//  AchievementsListViewController.swift
//  StashCoach
//
//  Created by Amit Biswas on 11/26/20.
//  Copyright © 2020 Amit Biswas. All rights reserved.
//

import UIKit

class AchievementsListViewController: UIViewController {

    //MARK: Constants
    private let achievementListCellNib = "AchievementListCell"
    private let achievementListCellIdentifier = "achievementListCellIdentifier"
    
    
    //MARK: Variables
    var presenter: AchievementListPresenterProtocol?
    private var achievementList = AchievementList()
    
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.separatorColor = .clear
        }
    }
    
    @IBOutlet weak var outerView: UIView! {
        didSet {
            outerView.backgroundColor = UIColor(0xF2F3F5)
        }
    }
    
    
    //MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initalizePresenterAndInteractor()
        setupNavBar()
        registerNib()
    }
    

}


//MARK: Private Methods Extension

extension AchievementsListViewController {
    
    private func initalizePresenterAndInteractor() {
        let presenter: AchievementListPresenterProtocol & AchievementListInteractorOutputProtocol = AchievementListPresenter()
        let interactor: AchievementListInteractorInputProtocol = AchievementListInteractor()
        self.presenter = presenter
        self.presenter?.view = self
        self.presenter?.interactor = interactor
        self.presenter?.interactor?.presenter = self.presenter as? AchievementListInteractorOutputProtocol
        self.presenter?.fetchAchievementsOnLoad()
    }
    
    private func setupNavBar() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor(0x6b34cc)
    }
    
    private func registerNib() {
        let nib = UINib(nibName: achievementListCellNib, bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier: achievementListCellIdentifier)
    }
    
}


//MARK: UITableView Delegate

extension AchievementsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}


//MARK: UITableView Data Source

extension AchievementsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievementList.achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: achievementListCellIdentifier,
                                                 for: indexPath) as! AchievementListCell
        cell.setData(achievement: achievementList.achievements[indexPath.row])
        cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
        return cell
        
    }
    
}


//MARK: AchievementListViewProtocol Extension

extension AchievementsListViewController: AchievementListViewProtocol {
    
    func showAchievements(achievementsList: AchievementList) {
        self.achievementList = achievementsList
        self.title = achievementList.title
        tableView.reloadData()
    }
    
}
