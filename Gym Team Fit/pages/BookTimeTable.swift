//
//  BookTimeTable.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 12/08/23.
//
import UIKit

var savedTimes: [String] = []
var lesson = "unknown"

class BookTimeTable: BaseVC {
    
    var workShopEnabled = false
    var count = 0
    
    lazy var frameImgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white.withAlphaComponent(0.6)
        view.layer.cornerRadius = 15
        
        return view
    }()

    lazy var trainingNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "    Fitness coach   "
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Montserrat-Bold", size: 24)
        lbl.backgroundColor = .typeCoachBGColor().withAlphaComponent(0.8)
        lbl.layer.cornerRadius = 10
        lbl.clipsToBounds = true
        
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
    
    
    lazy var reserveStatusLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Training reserved"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.isHidden = true
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Raleway-Bold", size: 30)
        
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
        btn.addTarget(self, action: #selector(okAction), for: .touchUpInside)
        btn.isHidden = true
        
        return btn
    }()
    
    
    lazy var collectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(BookTimesCell.self, forCellWithReuseIdentifier: BookTimesCell.identifier)
        collection.backgroundColor = .clear

        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureForWorkshop()
        count = userDM.getReserveCount()
        savedTimes = userDM.load()
        print(savedTimes)
    }
    
    @objc func okAction(){
        hideItems(hide: false)
    }
    
}



extension BookTimeTable: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookTimesCell.identifier, for: indexPath) as! BookTimesCell
        cell.timeLbl.text = dataForTime[indexPath.item]
        itemFor = indexPath.item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-30)/3, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if savedTimes.contains(dataForTime[indexPath.item]){
            hideItems(hide: true)
            reserveStatusLbl.text = "Your reserve is canceled"
            savedTimes.remove(object: dataForTime[indexPath.item])            
        }else{
            if count>=5{
                reserveStatusLbl.text = "The number of reservations for the day has run out"
            }else{
                reserveStatusLbl.text = "Training reserved"
                savedTimes.append(dataForTime[indexPath.item])
                collectionView.cellForItem(at: indexPath)?.backgroundColor = #colorLiteral(red: 0.4, green: 0.7568627451, blue: 0.2392156863, alpha: 1).withAlphaComponent(0.6)
            }
            count+=1
            userDM.setCountReserve(count: count)
            hideItems(hide: true)
        }
        userDM.save(items: savedTimes)
        print(userDM.load())
    }
    
    
}



extension BookTimeTable {
    
    func hideItems(hide: Bool){
        collectionV.isHidden = hide
        trainingNameLbl.isHidden = hide
        reserveStatusLbl.isHidden = !hide
        okBtn.isHidden = !hide
    }

    
    fileprivate func configureForWorkshop(){
        frameImgView.layer.borderWidth = 5
        frameImgView.layer.borderColor = #colorLiteral(red: 1, green: 0.5582012534, blue: 0.07092597336, alpha: 1).cgColor
        frameImgConst()
        traningNameLblConst()
        collectionVConst()
        reserveStatusLblConst()
        okBtnConst()
    }

    
    fileprivate func frameImgConst(){
        view.addSubview(frameImgView)
        frameImgView.top(topView.bottomAnchor, 50)
        frameImgView.left(view.leftAnchor, 30)
        frameImgView.right(view.rightAnchor, -30)
        if view.frame.height > 740 {
            frameImgView.bottom(view.centerYAnchor, 120)
        }else{
            frameImgView.bottom(view.safeAreaLayoutGuide.bottomAnchor, -130)
        }
    }
    
    
    fileprivate func traningNameLblConst(){
        view.addSubview(trainingNameLbl)
        trainingNameLbl.centerX(frameImgView.centerXAnchor)
        trainingNameLbl.top(frameImgView.topAnchor, 20)
    }
    
    
    fileprivate func collectionVConst(){
        view.addSubview(collectionV)
        collectionV.top(trainingNameLbl.bottomAnchor, 20)
        collectionV.right(frameImgView.rightAnchor, -10)
        collectionV.left(frameImgView.leftAnchor, 10)
        collectionV.height(300)
    }
    
    
    fileprivate func reserveStatusLblConst(){
        view.addSubview(reserveStatusLbl)
        reserveStatusLbl.centerY(frameImgView.centerYAnchor)
        reserveStatusLbl.right(frameImgView.rightAnchor, -20)
        reserveStatusLbl.left(frameImgView.leftAnchor, 20)
    }
   
    
    fileprivate func okBtnConst(){
        view.addSubview(okBtn)
        okBtn.bottom(frameImgView.bottomAnchor, -20)
        okBtn.centerX(frameImgView.centerXAnchor)
        okBtn.height(40)
        okBtn.width(100)
    }
    
 
}
