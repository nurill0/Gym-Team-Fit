//
//  FeedbacksCell.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 09/08/23.
//

import UIKit

class FeedbacksCell: UITableViewCell {
    
    static let identifer = "feedbackCell"
    
    lazy var containerV: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .baseColor().withAlphaComponent(0.7)
        v.layer.cornerRadius = 15
        
        return v
    }()
    
    
    lazy var dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "July 12"
        lbl.textAlignment = .left
        lbl.textColor =  #colorLiteral(red: 1, green: 0.5582012534, blue: 0.07092597336, alpha: 1)
        lbl.font = UIFont(name: "Raleway-SemiBold", size: 15)
        
        return lbl
    }()
    
    
    lazy var starsLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "★★★★★"
        lbl.textAlignment = .right
        lbl.textColor =  #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        
        return lbl
    }()
    
    
    lazy var feedbackTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Really enjoyed the yoga class with trainer Anna"
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.textColor =  .white
        lbl.font = UIFont(name: "Raleway-SemiBold", size: 18)
        
        return lbl
    }()
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configureUI()
        self.backgroundColor = .clear
    }
    
    
}



//MARK: UI
extension FeedbacksCell {
    
    fileprivate func configureUI(){
        containerVConst()
        dateLblConst()
        starsLblConst()
        textLblConst()
    }
    
    
    fileprivate func containerVConst(){
        self.addSubview(containerV)
        containerV.top(self.topAnchor, 10)
        containerV.bottom(self.bottomAnchor, -10)
        containerV.right(self.rightAnchor, -20)
        containerV.left(self.leftAnchor, 20)
    }
    
    
    fileprivate func dateLblConst(){
        containerV.addSubview(dateLabel)
        dateLabel.top(containerV.topAnchor, 15)
        dateLabel.left(containerV.leftAnchor, 10)
    }
    
    
    fileprivate func starsLblConst(){
        containerV.addSubview(starsLabel)
        starsLabel.bottom(dateLabel.centerYAnchor, 5)
        starsLabel.right(containerV.rightAnchor, -10)
    }
    
    
    fileprivate func textLblConst(){
        containerV.addSubview(feedbackTextLabel)
        feedbackTextLabel.top(dateLabel.bottomAnchor)
        feedbackTextLabel.left(dateLabel.leftAnchor)
        feedbackTextLabel.right(starsLabel.rightAnchor)
        feedbackTextLabel.bottom(containerV.bottomAnchor, -15)
    }
    
}
