//
//  FeedbackVC.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 09/08/23.
//

import UIKit

class FeedbackVC: BaseVC, UITextFieldDelegate, UITextViewDelegate {
    
    var starBtnTag = 0
    var feedbacks: [String] = ["Really enjoyed the yoga class with trainer Anna"]
    var starTap = UIButton()
    
    
    lazy var feedbackLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Please leave a feedback"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Raleway-SemiBold", size: 20)
        lbl.textColor = .white
        
        return lbl
    }()
    
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    
    lazy var feedBackTextInputView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white.withAlphaComponent(0.7)
        view.layer.cornerRadius = 14
        
        return view
    }()
    
    
    lazy var feedBackTF: UITextView = {
        let textV = UITextView()
        textV.translatesAutoresizingMaskIntoConstraints = false
        textV.textAlignment  = .left
        textV.delegate = self
        textV.text = ""
        textV.font = .monospacedDigitSystemFont(ofSize: 20, weight: .medium)
        textV.backgroundColor = .clear
        textV.textColor = .black
        
        return textV
    }()
    
    
    lazy var placeHolderLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Type your feedback here"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Raleway-SemiBold", size: 20)
        lbl.textColor = .gray
        
        return lbl
    }()
    
    
    lazy var sendFBBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Send", for: .normal)
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
        btn.addTarget(self, action: #selector(addFeedbacks), for: .touchUpInside)
        
        return btn
    }()
    
    
    lazy var feedbacksTableView: UITableView = {
        let tbV = UITableView()
        tbV.translatesAutoresizingMaskIntoConstraints = false
        tbV.autoresizesSubviews = true
        tbV.register(FeedbacksCell.self, forCellReuseIdentifier: FeedbacksCell.identifer)
        tbV.delegate = self
        tbV.dataSource = self
        tbV.separatorStyle = .none
        tbV.rowHeight = UITableView.automaticDimension
        tbV.backgroundColor = .clear
        tbV.showsVerticalScrollIndicator = false
        
        return tbV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFeedbackUI()
    }
    
}


//MARK: functions
extension FeedbackVC {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        placeHolderLbl.isHidden = true
        return true
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if feedBackTF.text.isEmpty {
            placeHolderLbl.isHidden = false
        }else{
            placeHolderLbl.isHidden = true
        }
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        playAudio()
    }
    
    
    @objc func addFeedbacks(){
        playAudio()
        guard let text = feedBackTF.text, !feedBackTF.text.isEmpty else {return}
        feedbacks.append(text)
        feedbacksTableView.reloadData()
        feedBackTF.text = ""
        placeHolderLbl.isHidden = false
    }
    
}



//MARK: tableview delegate and datasource
extension FeedbackVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbacks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedbacksCell.identifer, for: indexPath) as! FeedbacksCell
        cell.feedbackTextLabel.text = feedbacks[indexPath.row]
        return cell
    }
    
    
}



//MARK: UI
extension FeedbackVC {
    
    
    fileprivate func configureFeedbackUI(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        feedBackLblConst()
        stackViewConst()
        feedBackTextInputViewConst()
        sendFBBtnConst()
        feedbackTFConst()
        placeHolderConst()
        feedbacksCollcetionVConst()
    }
    
    
    fileprivate func feedBackLblConst(){
        view.addSubview(feedbackLbl)
        feedbackLbl.top(topView.bottomAnchor, 20)
        feedbackLbl.centerX(view.centerXAnchor)
    }
    
    
    fileprivate func stackViewConst(){
        view.addSubview(stackView)
        stackView.top(feedbackLbl.bottomAnchor)
        stackView.right(feedbackLbl.rightAnchor)
        stackView.left(feedbackLbl.leftAnchor)
        stackView.height(50)
        for i in 0...4 {
            starTap = UIButton()
            starTap.translatesAutoresizingMaskIntoConstraints = false
            starTap.setImage(UIImage(named: "starFill"), for: .normal)
            starTap.imageView?.contentMode = .scaleAspectFill
            starTap.tag = i
            stackView.addArrangedSubview(starTap)
        }
    }
    
    
    fileprivate func feedBackTextInputViewConst(){
        view.addSubview(feedBackTextInputView)
        feedBackTextInputView.top(stackView.bottomAnchor, 10)
        feedBackTextInputView.right(view.rightAnchor, -25)
        feedBackTextInputView.left(view.leftAnchor, 25)
        feedBackTextInputView.bottom(view.centerYAnchor)
    }
    
    
    fileprivate func sendFBBtnConst(){
        feedBackTextInputView.addSubview(sendFBBtn)
        sendFBBtn.centerX(feedBackTextInputView.centerXAnchor)
        sendFBBtn.bottom(feedBackTextInputView.bottomAnchor, -10)
        sendFBBtn.height(40)
        sendFBBtn.width(120)
    }
    
    
    fileprivate func feedbackTFConst(){
        feedBackTextInputView.addSubview(feedBackTF)
        feedBackTF.top(feedBackTextInputView.topAnchor, 10)
        feedBackTF.left(feedBackTextInputView.leftAnchor, 10)
        feedBackTF.right(feedBackTextInputView.rightAnchor, -10)
        feedBackTF.bottom(sendFBBtn.topAnchor, -10)
    }
    
    
    fileprivate func placeHolderConst(){
        feedBackTextInputView.addSubview(placeHolderLbl)
        placeHolderLbl.top(feedBackTextInputView.topAnchor, 15)
        placeHolderLbl.left(feedBackTextInputView.leftAnchor, 15)
    }
    
    
    fileprivate func feedbacksCollcetionVConst(){
        view.addSubview(feedbacksTableView)
        feedbacksTableView.top(feedBackTextInputView.bottomAnchor, 10)
        feedbacksTableView.right(view.rightAnchor)
        feedbacksTableView.left(view.leftAnchor)
        feedbacksTableView.bottom(view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    
}
