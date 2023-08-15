//
//  CoachsItemView.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 09/08/23.
//

import Foundation
import UIKit


class CoachsItemView: UIView {
    
    lazy var dotLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "●"
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 10, weight: .bold)
        
        return lbl
    }()
    
    lazy var typeCoachLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "    Fitness coach   "
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.backgroundColor = .typeCoachBGColor().withAlphaComponent(0.8)
        lbl.layer.cornerRadius = 10
        lbl.clipsToBounds = true
        
        return lbl
    }()
    
    
    lazy var firstCoachLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Anna Lubin"
        lbl.textColor = .coachNameColor()
        lbl.textAlignment = .center
        lbl.numberOfLines = 1
        lbl.font = .monospacedDigitSystemFont(ofSize: 11, weight: .medium)
        
        return lbl
    }()
    
    
    lazy var firstCoachImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "1")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var secondCoachLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Anna Lubin"
        lbl.textColor = .coachNameColor()
        lbl.textAlignment = .center
        lbl.numberOfLines = 1
        lbl.font = .monospacedDigitSystemFont(ofSize: 11, weight: .medium)
        
        return lbl
    }()
    
    
    lazy var secondCoachImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "1")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var thirdCoachLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Anna Lubin"
        lbl.textColor = .coachNameColor()
        lbl.textAlignment = .center
        lbl.numberOfLines = 1
        lbl.font = .monospacedDigitSystemFont(ofSize: 11, weight: .medium)
        
        return lbl
    }()
    
    
    lazy var thirdCoachImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "1")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    convenience init(firstCoach: String,secondCoach: String,thirdCoach: String, firstImg: String, secondImg: String, thirdImg: String) {
        self.init(frame: .zero)
        firstCoachLbl.text = firstCoach
        secondCoachLbl.text = secondCoach
        thirdCoachLbl.text = thirdCoach
        firstCoachImageView.image = UIImage(named: firstImg)
        secondCoachImageView.image = UIImage(named: secondImg)
        thirdCoachImageView.image = UIImage(named: thirdImg)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CoachsItemView {
    
    fileprivate func configureUI(){
        self.translatesAutoresizingMaskIntoConstraints = false
        coachtypeLblConst()
        dotLblConst()
        secondCoachImgConst()
        secondCoachNameLblConst()
        firstCoachImgConst()
        firstCoachNameLblConst()
        thirdCoachImgConst()
        thirdCoachNameLblConst()
    }
    
    
    fileprivate func dotLblConst(){
        self.addSubview(dotLbl)
        dotLbl.left(self.leftAnchor, 10)
        dotLbl.centerY(typeCoachLbl.centerYAnchor)
        dotLbl.height(10)
        dotLbl.width(10)
    }
    
    
    fileprivate func coachtypeLblConst(){
        self.addSubview(typeCoachLbl)
        typeCoachLbl.left(self.leftAnchor, 30)
        typeCoachLbl.top(self.topAnchor, 10)
    }
    
    
    fileprivate func secondCoachImgConst(){
        self.addSubview(secondCoachImageView)
        secondCoachImageView.centerX(self.centerXAnchor)
        secondCoachImageView.top(typeCoachLbl.bottomAnchor, 10)
        secondCoachImageView.height(40)
        secondCoachImageView.width(40)
    }
    
    
    fileprivate func secondCoachNameLblConst(){
        self.addSubview(secondCoachLbl)
        secondCoachLbl.top(secondCoachImageView.bottomAnchor, 5)
        secondCoachLbl.centerX(secondCoachImageView.centerXAnchor)
    }
    
    
    fileprivate func firstCoachImgConst(){
        self.addSubview(firstCoachImageView)
        firstCoachImageView.left(self.leftAnchor, 30)
        firstCoachImageView.centerY(secondCoachImageView.centerYAnchor)
        firstCoachImageView.height(40)
        firstCoachImageView.width(40)
    }
    
    
    fileprivate func firstCoachNameLblConst(){
        self.addSubview(firstCoachLbl)
        firstCoachLbl.centerY(secondCoachLbl.centerYAnchor)
        firstCoachLbl.centerX(firstCoachImageView.centerXAnchor)
    }
    
    
    fileprivate func thirdCoachImgConst(){
        self.addSubview(thirdCoachImageView)
        thirdCoachImageView.right(self.rightAnchor, -30)
        thirdCoachImageView.centerY(secondCoachImageView.centerYAnchor)
        thirdCoachImageView.height(40)
        thirdCoachImageView.width(40)
    }
    
    
    fileprivate func thirdCoachNameLblConst(){
        self.addSubview(thirdCoachLbl)
        thirdCoachLbl.centerY(secondCoachLbl.centerYAnchor)
        thirdCoachLbl.centerX(thirdCoachImageView.centerXAnchor)
    }
    
    
}
