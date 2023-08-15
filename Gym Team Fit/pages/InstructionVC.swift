//
//  InstructionVC.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 11/08/23.
//

import UIKit

class InstructionVC: BaseVC {
    
    var workShopEnabled = false
    
    lazy var frameImgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white.withAlphaComponent(0.6)
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    
    lazy var qrCodeImgView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "lockerInstructionQR")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    
    lazy var reserveStatusLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Scan the QR on the empty locker"
        lbl.textColor = .baseColor()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Raleway-Bold", size: 24)
        
        return lbl
    }()
    
    
    lazy var codeTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "****"
        tf.isSecureTextEntry = true
        tf.textAlignment = .center
        tf.font = UIFont(name: "Raleway-Bold", size: 24)
        tf.layer.borderWidth = 5
        tf.layer.borderColor = #colorLiteral(red: 1, green: 0.5582012534, blue: 0.07092597336, alpha: 1).cgColor
        tf.layer.cornerRadius = 14
        tf.backgroundColor = .clear
        
        return tf
    }()
    
    
    lazy var aboutStatusLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Think of a four-digit password and enter it. After re-entering, the locker will be unlocked"
        lbl.textColor = .baseColor()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Raleway-Bold", size: 22)
        
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if workShopEnabled {
            configureForWorkshop()
        }else{
            configureInstructionUI()
        }
    }
    
}



extension InstructionVC {
    
    fileprivate func configureInstructionUI(){
        frameImgConst()
        codeTFConst()
        aboutLblConst()
        reserveStatusLblConst()
        qrImageConst()
    }
    
    
    fileprivate func configureForWorkshop(){
        frameImgView.layer.borderWidth = 5
        frameImgView.layer.borderColor = #colorLiteral(red: 1, green: 0.5582012534, blue: 0.07092597336, alpha: 1).cgColor
        frameImgConst()
        aboutStatusLblFowWorkshop()
    }
    
    
    fileprivate func aboutStatusLblFowWorkshop(){
        aboutStatusLbl.text = """
    Book your classes early to make sure you get to them on time. You can book up to 5 classes per day If you are unable to attend, please remember to cancel as there may not be enough room for someone else. To book a training session - click on the time that suits you. To cancel a training session - click on the training session you have previously booked
""".uppercased()
        aboutStatusLbl.font = UIFont(name: "Raleway-Bold", size: 22)
        
        frameImgView.addSubview(aboutStatusLbl)
        aboutStatusLbl.top(frameImgView.topAnchor, 15)
        aboutStatusLbl.left(frameImgView.leftAnchor, 15)
        aboutStatusLbl.right(frameImgView.rightAnchor, -15)
        aboutStatusLbl.bottom(frameImgView.bottomAnchor, -15)
    }
    
    
    fileprivate func frameImgConst(){
        view.addSubview(frameImgView)
        frameImgView.top(topView.bottomAnchor, 50)
        frameImgView.left(view.leftAnchor, 30)
        frameImgView.right(view.rightAnchor, -30)
        frameImgView.bottom(view.safeAreaLayoutGuide.bottomAnchor, -30)
    }
    
    
    fileprivate func aboutLblConst(){
        frameImgView.addSubview(aboutStatusLbl)
        aboutStatusLbl.top(codeTF.bottomAnchor, 20)
        aboutStatusLbl.left(frameImgView.leftAnchor, 15)
        aboutStatusLbl.right(frameImgView.rightAnchor, -15)
    }
    
    
    fileprivate func codeTFConst(){
        frameImgView.addSubview(codeTF)
        codeTF.top(frameImgView.centerYAnchor, 15)
        codeTF.centerX(frameImgView.centerXAnchor)
        codeTF.height(70)
        codeTF.width(200)
    }
    
    
    fileprivate func reserveStatusLblConst(){
        frameImgView.addSubview(reserveStatusLbl)
        reserveStatusLbl.bottom(frameImgView.centerYAnchor)
        reserveStatusLbl.left(frameImgView.leftAnchor, 15)
        reserveStatusLbl.right(frameImgView.rightAnchor, -15)
    }
    
    
    fileprivate func qrImageConst(){
        frameImgView.addSubview(qrCodeImgView)
        qrCodeImgView.top(frameImgView.topAnchor, 10)
        qrCodeImgView.bottom(reserveStatusLbl.topAnchor, -10)
        qrCodeImgView.centerX(frameImgView.centerXAnchor)
    }
    
    
}
