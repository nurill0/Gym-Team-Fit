//
//  CoachCornerVC.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 09/08/23.
//

import UIKit

class CoachCornerVC: BaseVC {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillEqually
        stack.backgroundColor = .baseColor().withAlphaComponent(0.7)
        stack.layer.cornerRadius = 12
        
        return stack
    }()
    
    lazy var firstItem: CoachsItemView = {
        let coach = CoachsItemView(firstCoach: "Anna Lubin", secondCoach: "Miracle Herwitz", thirdCoach: "Cristofer Kenter", firstImg: "1", secondImg: "2", thirdImg: "3")
        coach.typeCoachLbl.text = "     Fitness coach   "
        
        return coach
    }()
    
    
    lazy var secondItem: CoachsItemView = {
        let coach = CoachsItemView(firstCoach: "Wilson Curtis", secondCoach: "Erin Bergson", thirdCoach: "Miracle Franci", firstImg: "4", secondImg: "5", thirdImg: "6")
        coach.typeCoachLbl.text = "     Powerlifting coach  "
        
        return coach
    }()
    
    
    lazy var thirdItem: CoachsItemView = {
        let coach = CoachsItemView(firstCoach: "Alena Saris", secondCoach: "Lincoln Vaccaro", thirdCoach: "Kadin Siphron", firstImg: "7", secondImg: "8", thirdImg: "9")
        coach.typeCoachLbl.text = "     Yoga master     "
        
        
        return coach
    }()
    
    
    lazy var fouthItem: CoachsItemView = {
        let coach = CoachsItemView(firstCoach: "Ruben Kenter", secondCoach: "Emery Vetrovs", thirdCoach: "Alfonso Philips", firstImg: "10", secondImg: "11", thirdImg: "12")
        coach.typeCoachLbl.text = "     Dance activities    "
        
        return coach
    }()
    
    
    lazy var fivesItem: CoachsItemView = {
        let coach = CoachsItemView(firstCoach: "Rayna Press", secondCoach: "Tiana Levin", thirdCoach: "Livia Torff", firstImg: "13", secondImg: "14", thirdImg: "15")
        coach.typeCoachLbl.text = "     Restorative practice     "
        
        return coach
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCoachCornerUI()
    }
    
}



extension CoachCornerVC {
    fileprivate func configureCoachCornerUI(){
        view.addSubview(stackView)
        if view.frame.height > 670 {
            stackView.top(topView.bottomAnchor, 50)
            stackView.right(view.rightAnchor, -25)
            stackView.left(view.leftAnchor, 25)
            stackView.bottom(view.bottomAnchor, -90)
        }else{
            stackView.top(topView.bottomAnchor, 20)
            stackView.right(view.rightAnchor, -25)
            stackView.left(view.leftAnchor, 25)
            stackView.bottom(view.bottomAnchor, -20)
        }
        
        stackView.addArrangedSubview(firstItem)
        stackView.addArrangedSubview(secondItem)
        stackView.addArrangedSubview(thirdItem)
        stackView.addArrangedSubview(fouthItem)
        stackView.addArrangedSubview(fivesItem)
    }
    
}
