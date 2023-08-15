//
//  LessonTimeItemView.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 10/08/23.

import UIKit


class LessonTimeItemView: UIView {
    
    var timeCount = 8
    var userDefaultsManager = UserDefaultsManager.shared
    
    lazy var timeLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "\(timeCount):00 - \(timeCount):45"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Montserrat-Medium", size: 12)
        
        return lbl
    }()
    
    
    lazy var vacantLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Vacant: \(3)"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Montserrat-Medium", size: 12)
        
        return lbl
    }()
    
    
    lazy var lockedImgV: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "locked")
        img.isHidden = true
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    convenience init(time: String, vacantNum: String) {
        self.init(frame: .zero)
        timeLbl.text = time
        vacantLbl.text = "Vacant: \(vacantNum)"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



//UI
extension LessonTimeItemView {
    
    fileprivate func configureUI(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 8
        timeLblConst()
        vacantLblConst()
        lockedImgVConst()
    }
    
    
    fileprivate func timeLblConst(){
        self.addSubview(timeLbl)
        timeLbl.top(self.topAnchor, 5)
        timeLbl.centerX(self.centerXAnchor)
    }
    
    
    fileprivate func vacantLblConst(){
        self.addSubview(vacantLbl)
        vacantLbl.top(timeLbl.bottomAnchor, 5)
        vacantLbl.centerX(timeLbl.centerXAnchor)
        vacantLbl.bottom(self.bottomAnchor, -5)
    }
    
    
    fileprivate func lockedImgVConst(){
        self.addSubview(lockedImgV)
        lockedImgV.centerX(self.centerXAnchor, 5)
        lockedImgV.centerY(self.centerYAnchor)
    }
    
}
