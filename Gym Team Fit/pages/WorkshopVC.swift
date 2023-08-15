//
//  WorkshopVC.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 09/08/23.
//

import UIKit

class WorkshopVC: BaseVC {
    
    var data = Datas()
    var bookedTime = ""
    var countReserve = 0
    var itemNum = 0
    var changedFirst = false
    var changedSecond = false
    
    lazy var infoBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "infobtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(goInstruction), for: .touchUpInside)
        btn.tag = 0
        
        return btn
    }()
    
    
    lazy var frameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 5
        view.layer.borderColor = #colorLiteral(red: 1, green: 0.5582012534, blue: 0.07092597336, alpha: 1).cgColor
        view.layer.cornerRadius = 40
        
        return view
    }()
    
    lazy var lessonLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Lessson"
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Montserrat-Medium", size: 14)
        
        return lbl
    }()
    
    lazy var timeLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Book"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Montserrat-Medium", size: 14)
        
        return lbl
    }()
    
    
    lazy var collectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(WorkshopCell.self, forCellWithReuseIdentifier: WorkshopCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clipsToBounds = true
        collectionView.layer.masksToBounds = true
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    lazy var reserveView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "reserveView")
        view.contentMode = .scaleAspectFit
        view.isHidden = true
        
        return view
    }()
    
    lazy var reserveStatusLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Training reserved"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Raleway-Bold", size: 40)
        
        return lbl
    }()
    
    
    lazy var okBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("ok", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 25)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .itemsBaseColor().withAlphaComponent(0.8)
        btn.layer.cornerRadius = 22
        btn.layer.borderColor = UIColor.borderColor().cgColor
        btn.layer.borderWidth = 4
        btn.layer.shadowColor = UIColor.baseColor().cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 5)
        btn.layer.shadowOpacity = 10
        btn.layer.shadowRadius = 1.2
        btn.isHidden = true
        
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWorkShopUI()
    }
    
    
}



extension WorkshopVC{
    

  
    
  
    
    func hideReserveElements(isHidden: Bool){
        frameView.isHidden = isHidden
        collectionV.isHidden = isHidden
        lessonLbl.isHidden = isHidden
        timeLbl.isHidden = isHidden
        reserveView.isHidden = !isHidden
        reserveStatusLbl.isHidden = !isHidden
        okBtn.isHidden = !isHidden
    }
}



extension WorkshopVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.getSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkshopCell.identifier, for: indexPath) as! WorkshopCell
        cell.getItems(nameLesson: data.getitems(index: indexPath.item).title, vacant: data.getitems(index: indexPath.item).id)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BookTimeTable()
        vc.modalPresentationStyle = .fullScreen
        lesson = data.getitems(index: indexPath.item).title
        present(vc, animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 65)
    }
    
    
    
    
    
    
}




extension WorkshopVC {
    
    fileprivate func configureWorkShopUI(){
        infoBtnConst()
        frameViewConst()
        lessonlblConst()
        timelblConst()
        collecttionViewConst()
        reserFrameViewConst()
        reserveLblConst()
        okbtnConst()
    }
    
    fileprivate func infoBtnConst(){
        view.addSubview(infoBtn)
        infoBtn.top(topView.bottomAnchor, 30)
        infoBtn.left(view.leftAnchor, 30)
        infoBtn.height(50)
        infoBtn.width(50)
    }
    
    fileprivate func frameViewConst(){
        view.addSubview(frameView)
        frameView.top(infoBtn.bottomAnchor,10)
        frameView.left(view.leftAnchor, 30)
        frameView.right(view.rightAnchor, -30)
        frameView.bottom(view.safeAreaLayoutGuide.bottomAnchor, -20)
    }
    
    fileprivate func lessonlblConst(){
        view.addSubview(lessonLbl)
        lessonLbl.top(frameView.topAnchor, 30)
        lessonLbl.left(frameView.leftAnchor, 35)
    }
    
    fileprivate func timelblConst(){
        view.addSubview(timeLbl)
        timeLbl.top(lessonLbl.topAnchor)
        timeLbl.right(frameView.rightAnchor, -60)
    }
    
    
    fileprivate func collecttionViewConst(){
        view.addSubview(collectionV)
        collectionV.top(lessonLbl.bottomAnchor, 5)
        collectionV.left(frameView.leftAnchor, 5)
        collectionV.right(frameView.rightAnchor, -5)
        collectionV.bottom(frameView.bottomAnchor, -30)
    }
    
    fileprivate func reserFrameViewConst(){
        view.addSubview(reserveView)
        reserveView.top(infoBtn.bottomAnchor)
        reserveView.left(view.leftAnchor, 40)
        reserveView.right(view.rightAnchor, -40)
        reserveView.bottom(view.safeAreaLayoutGuide.bottomAnchor, -40)
    }
    
    fileprivate func reserveLblConst(){
        reserveView.addSubview(reserveStatusLbl)
        reserveStatusLbl.bottom(reserveView.centerYAnchor)
        reserveStatusLbl.left(reserveView.leftAnchor, 10)
        reserveStatusLbl.right(reserveView.rightAnchor, -10)
        
    }
    
    fileprivate func okbtnConst(){
        view.addSubview(okBtn)
        okBtn.centerX(view.centerXAnchor)
        okBtn.top(reserveView.centerYAnchor, 60)
        okBtn.height(50)
        okBtn.width(130)
    }
}
