//
//  AchievementListCell.swift
//  StashCoach
//
//  Created by Amit Biswas on 11/26/20.
//  Copyright © 2020 Amit Biswas. All rights reserved.
//

import UIKit

class AchievementListCell: UITableViewCell {

    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var outerView: UIView! {
        didSet {
            outerView.layer.cornerRadius = 8
        }
    }
    
    @IBOutlet weak var cellBackgroundImage: UIImageView! {
        didSet {
            cellBackgroundImage.layer.cornerRadius = 8
        }
    }
    
    @IBOutlet weak var levelValue: UILabel!
    
    @IBOutlet weak var levelOuterView: UIView! {
        didSet {
            levelOuterView.layer.cornerRadius = 45
        }
    }
    
    @IBOutlet weak var progressOuterView: UIView! {
        didSet {
            progressOuterView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var progressInnerView: UIView! {
        didSet {
            progressInnerView.layer.cornerRadius = 8
            progressInnerView.backgroundColor = UIColor(0x82cc70)
            
        }
    }
    @IBOutlet weak var progressInnerViewWidthCnst: NSLayoutConstraint!
    
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var progressValueLabel: UILabel!
    
    
    // MARK: Internal Methods
    func setData(achievement: Achievement) {
        DispatchQueue.global(qos: .background).async {
            do {
                if let url = URL(string: achievement.bgImage ?? "") {
                    DispatchQueue.main.async {
                        self.hideViews()
                        self.activityIndicator.startAnimating()
                    }
                    
                    let data = try Data.init(contentsOf: url)
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                        self.cellBackgroundImage.image = UIImage(data: data) ?? UIImage()
                        self.showViews()
                    }
                }
            }
            catch {
                
            }
        }
        
        let outerViewWidth = progressOuterView.frame.width
        if let progress = achievement.progress, let totalProgress = achievement.total {
            let currentProgress = CGFloat(progress)/CGFloat(totalProgress)
            let currentProgressInPercentage = currentProgress * 100
            
            let calculateWidth = currentProgressInPercentage * outerViewWidth
            let progressInnerViewWidth = calculateWidth / 100
            progressInnerViewWidthCnst.constant = CGFloat(progressInnerViewWidth)
            
        }
        
        
        levelValue.text = achievement.level
        totalValueLabel.text = String.init(format: "%@pts", String(achievement.total ?? 0))
        progressValueLabel.text = String.init(format: "%@pts", String(achievement.progress ?? 0))
        
        if let isAccessible = achievement.accessible {
            if !isAccessible {
                blurView.isHidden = false
            } else {
                blurView.isHidden = true
            }
        } else {
            blurView.isHidden = true
        }
        
        
    }
    
    
    private func hideViews() {
        levelValue.isHidden = true
        levelOuterView.isHidden = true
        progressOuterView.isHidden = true
    }
    
    
    private func showViews() {
        levelValue.isHidden = false
        levelOuterView.isHidden = false
        progressOuterView.isHidden = false
    }
    
    
}
