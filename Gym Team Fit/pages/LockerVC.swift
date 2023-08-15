//
//  LockerVC.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 09/08/23.
//

import UIKit

class LockerVC: BaseVC {
    
    lazy var infoBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "infobtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(goInstruction), for: .touchUpInside)
        btn.tag = 1
        
        return btn
    }()

    
    lazy var lockaerQRImgView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "lockerQR")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var descriptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = """
   
    Bring the QR code to an
 available locker, then come
    up with a password

"""
        lbl.textColor = .white
        lbl.backgroundColor = .itemsBaseColor().withAlphaComponent(0.5)
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Raleway-Bold", size: 22)
        lbl.layer.borderWidth = 7
        lbl.layer.borderColor = #colorLiteral(red: 1, green: 0.5582012534, blue: 0.07092597336, alpha: 1).cgColor
        lbl.layer.cornerRadius = 28
        lbl.clipsToBounds = true
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

}




extension LockerVC {
    
    fileprivate func configureUI(){
        infoBtnConst()
        lockerQRImgVConst()
        descLblConst()
    }
    
    fileprivate func infoBtnConst(){
        view.addSubview(infoBtn)
        infoBtn.top(topView.bottomAnchor)
        infoBtn.centerX(view.centerXAnchor)
        infoBtn.height(70)
        infoBtn.width(70)
    }
    
    fileprivate func lockerQRImgVConst(){
        view.addSubview(lockaerQRImgView)
        lockaerQRImgView.top(infoBtn.bottomAnchor)
        lockaerQRImgView.centerX(view.centerXAnchor)
    }
    
    
    fileprivate func descLblConst(){
        view.addSubview(descriptionLbl)
        descriptionLbl.top(lockaerQRImgView.bottomAnchor, 20)
        descriptionLbl.right(view.rightAnchor, -20)
        descriptionLbl.left(view.leftAnchor, 20)
    }
}
