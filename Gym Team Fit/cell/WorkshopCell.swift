//
//  WorkshopCell.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 10/08/23.
//

import UIKit

class WorkshopCell: UICollectionViewCell {
    
    static let identifier = "WorkshopCell"
    var isHide = false
    let udManager = UserDefaultsManager.shared
    var title = ""
    
    lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Pilates"
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Montserrat-Bold", size: 18)
        
        return lbl
    }()
    
    
    lazy var rightIcon: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "right")?.withTintColor( #colorLiteral(red: 0, green: 0.1551030576, blue: 0.3369712234, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        btn.contentMode = .scaleAspectFill
        btn.tag = 0
        
        return btn
    }()
    
    
    lazy var bookNowLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = " Book now   "
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.layer.cornerRadius = 10
        lbl.clipsToBounds = true
        lbl.font = UIFont(name: "Raleway-Bold", size: 16)
        lbl.backgroundColor = .typeCoachBGColor().withAlphaComponent(0.8)
        
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



//logics
extension WorkshopCell {
    
    func getItems(nameLesson: String, vacant: String){
        self.nameLbl.text = nameLesson
    }
    
}



//UI
extension WorkshopCell {
    
    fileprivate func configureUI(){
        self.backgroundColor = .white.withAlphaComponent(0.6)
        rightIconConst()
        bookNowLblConst()
        nameLblConst()
    }
    
    
    fileprivate func nameLblConst(){
        self.addSubview(nameLbl)
        nameLbl.left(self.leftAnchor, 20)
        nameLbl.centerY(self.centerYAnchor)
        nameLbl.right(bookNowLbl.leftAnchor, -10)
    }
    
    
    fileprivate func rightIconConst(){
        self.addSubview(rightIcon)
        rightIcon.centerY(self.centerYAnchor)
        rightIcon.right(self.rightAnchor, -5)
        rightIcon.height(15)
        rightIcon.width(15)
    }
    
    
    fileprivate func bookNowLblConst(){
        self.addSubview(bookNowLbl)
        bookNowLbl.right(rightIcon.leftAnchor, -10)
        bookNowLbl.centerY(self.centerYAnchor)
        bookNowLbl.height(40)
    }
    
}
