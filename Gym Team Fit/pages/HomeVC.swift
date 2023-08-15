//
//  ViewController.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 09/08/23.
//

import UIKit
import AVFoundation

class HomeVC: UIViewController {
    
    let userDM = UserDefaultsManager.shared
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .baseColor()
        
        return view
    }()
    
    lazy var bgImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "menu")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    
    lazy var idView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        return view
    }()
    
    lazy var playerIDLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Player ID"
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.font = UIFont(name: "Montserrat-Bold", size: 14)
        
        return lbl
    }()
    
    
    lazy var idTextView: UILabel = {
        let txtV = UILabel()
        txtV.translatesAutoresizingMaskIntoConstraints = false
        txtV.text = "\(userDM.getUserID())"
        txtV.backgroundColor = .black
        txtV.textColor = .white
        txtV.textAlignment = .center
        txtV.font = UIFont(name: "Montserrat-Bold", size: 16)
        txtV.layer.cornerRadius = 15
        txtV.clipsToBounds = true
        
        return txtV
    }()
    
    
    lazy var workshopBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Workshop", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 25)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .itemsBaseColor().withAlphaComponent(0.8)
        btn.layer.cornerRadius = 22
        btn.layer.borderColor = UIColor.borderColor().cgColor
        btn.layer.borderWidth = 4
        btn.tag = 0
        btn.addTarget(self, action: #selector(goPages(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var feedbackBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Feedback", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 25)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .itemsBaseColor().withAlphaComponent(0.8)
        btn.layer.cornerRadius = 22
        btn.layer.borderColor = UIColor.borderColor().cgColor
        btn.layer.borderWidth = 4
        btn.tag = 1
        btn.addTarget(self, action: #selector(goPages(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var coachCornerBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Coach corner", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 25)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .itemsBaseColor().withAlphaComponent(0.8)
        btn.layer.cornerRadius = 22
        btn.layer.borderColor = UIColor.borderColor().cgColor
        btn.layer.borderWidth = 4
        btn.tag = 2
        btn.addTarget(self, action: #selector(goPages(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var lockerBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Locker", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 25)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .itemsBaseColor().withAlphaComponent(0.8)
        btn.layer.cornerRadius = 22
        btn.layer.borderColor = UIColor.borderColor().cgColor
        btn.layer.borderWidth = 4
        btn.tag = 3
        btn.addTarget(self, action: #selector(goPages(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func playAudio() {
        var player = AVAudioPlayer()
        let url = Bundle.main.url(forResource: "tapSound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    
    @objc func goPages(sender: UIButton){
        playAudio()
        var vc = UIViewController()
        switch sender.tag {
        case 0: vc = WorkshopVC()
        case 1: vc = FeedbackVC()
        case 2: vc = CoachCornerVC()
        case 3: vc = LockerVC()
        default: vc = HomeVC()
        }
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}




extension HomeVC{
    
    fileprivate func configureUI(){
        bgImgVConst()
        topViewConst()
        idViewConst()
        playerIDLblConst()
        idtextVConst()
        workshopBtnConst()
        feedbackBtnConst()
        coachCornerBtnConst()
        lockerBtnConst()
    }
    
    
    fileprivate func bgImgVConst(){
        view.addSubview(bgImageView)
        bgImageView.top(view.topAnchor)
        bgImageView.right(view.rightAnchor)
        bgImageView.left(view.leftAnchor)
        bgImageView.bottom(view.bottomAnchor, 10)
    }
    
    
    fileprivate func topViewConst(){
        view.addSubview(topView)
        topView.top(view.topAnchor)
        topView.right(view.rightAnchor)
        topView.left(view.leftAnchor)
        if self.view.frame.height > 736 {
            topView.height(120)
            
        }else{
            topView.height(80)
        }
    }
    
    
    fileprivate func idViewConst(){
        view.addSubview(idView)
        idView.top(view.safeAreaLayoutGuide.topAnchor)
        idView.left(view.centerXAnchor, -40)
        idView.right(view.rightAnchor)
        idView.bottom(topView.bottomAnchor, -10)
    }
    
    
    fileprivate func playerIDLblConst(){
        idView.addSubview(playerIDLabel)
        playerIDLabel.centerY(idView.centerYAnchor)
        playerIDLabel.left(idView.leftAnchor, 5)
    }
    
    
    fileprivate func idtextVConst(){
        idView.addSubview(idTextView)
        idTextView.left(playerIDLabel.rightAnchor, 10)
        idTextView.right(idView.rightAnchor, -10)
        idTextView.top(idView.topAnchor, 10)
        idTextView.bottom(idView.bottomAnchor, -10)
    }
    
    
    fileprivate func workshopBtnConst(){
        view.addSubview(workshopBtn)
        workshopBtn.centerX(view.centerXAnchor, -30)
        workshopBtn.height(50)
        workshopBtn.width(200)
        workshopBtn.top(topView.bottomAnchor, 110)
    }
    
    
    fileprivate func feedbackBtnConst(){
        view.addSubview(feedbackBtn)
        feedbackBtn.left(workshopBtn.centerXAnchor)
        feedbackBtn.top(workshopBtn.bottomAnchor, 20)
        feedbackBtn.height(50)
        feedbackBtn.width(200)
    }
    
    
    fileprivate func coachCornerBtnConst(){
        view.addSubview(coachCornerBtn)
        coachCornerBtn.left(workshopBtn.centerXAnchor)
        coachCornerBtn.top(feedbackBtn.bottomAnchor, 20)
        coachCornerBtn.height(50)
        coachCornerBtn.width(200)
    }
    
    
    fileprivate func lockerBtnConst(){
        view.addSubview(lockerBtn)
        lockerBtn.left(workshopBtn.leftAnchor)
        lockerBtn.top(coachCornerBtn.bottomAnchor, 20)
        lockerBtn.height(50)
        lockerBtn.width(200)
    }
    
    
}
