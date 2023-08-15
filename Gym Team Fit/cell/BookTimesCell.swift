//
//  BookTimesCell.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 11/08/23.
//

import UIKit
var itemFor = 0
var isLocked = false
class BookTimesCell: UICollectionViewCell {
    
    static let identifier = "bookTimesCell"
    var userDefaultsManager = UserDefaultsManager.shared
    
    lazy var timeLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "8:00-8:45"
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if userDefaultsManager.load().contains(timeLbl.text!)  {
            self.backgroundColor = #colorLiteral(red: 0.4, green: 0.7568627451, blue: 0.2392156863, alpha: 1).withAlphaComponent(0.6)
        }else{
            self.backgroundColor = .baseColor().withAlphaComponent(0.6)
        }
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



extension BookTimesCell {
    
    fileprivate func configureUI(){
        self.layer.cornerRadius = 8
        self.backgroundColor = .baseColor().withAlphaComponent(0.6)
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
