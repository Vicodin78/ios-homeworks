//
//  ProfileHeaderView.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 01.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var statusText: String?
    
    let myView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
//        myView.backgroundColor = UIColor.lightGray
        return myView
    }()
    
    let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "panda")
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
        return avatarImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Hipster Panda"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        return titleLabel
    }()
    
    let secondTitle: UILabel = {
        let secondTitle = UILabel()
        secondTitle.translatesAutoresizingMaskIntoConstraints = false
        secondTitle.text = "Waiting for something..."
        secondTitle.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        secondTitle.textColor = .gray
        return secondTitle
    }()
    
    let buttonAct: UIButton = {
        let buttonAct = UIButton()
        buttonAct.translatesAutoresizingMaskIntoConstraints = false
        buttonAct.backgroundColor = .systemBlue
        buttonAct.layer.cornerRadius = 14//В задании стоит 4, но тогда не выглядит как на макете
        buttonAct.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonAct.layer.shadowRadius = 4
        buttonAct.layer.borderColor = UIColor.black.cgColor
        buttonAct.layer.shadowOpacity = 0.7
        buttonAct.setTitle("Set status", for: .normal)
        buttonAct.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return buttonAct
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Изменить статус"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
    
    let someButton: UIButton = {
        let someButton = UIButton()
        someButton.translatesAutoresizingMaskIntoConstraints = false
        someButton.backgroundColor = .systemMint
        someButton.layer.cornerRadius = 14//В задании стоит 4, но тогда не выглядит как на макете
        someButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        someButton.layer.shadowRadius = 4
        someButton.layer.borderColor = UIColor.black.cgColor
        someButton.layer.shadowOpacity = 0.7
        someButton.setTitle("Some Button", for: .normal)
        return someButton
    }()
    
    func layout() {
        
        [myView, avatarImageView, titleLabel, secondTitle, buttonAct, textField, someButton].forEach{addSubview($0)}
        
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            myView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            myView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            myView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.79)
        ])
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            titleLabel.leadingAnchor.constraint(equalTo: avatarImageView.safeAreaLayoutGuide.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            secondTitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            secondTitle.bottomAnchor.constraint(equalTo: buttonAct.topAnchor, constant: -64)
        ])
        
        NSLayoutConstraint.activate([
            buttonAct.topAnchor.constraint(equalTo: avatarImageView.safeAreaLayoutGuide.bottomAnchor, constant: 36),
            buttonAct.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAct.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            buttonAct.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 12),
            textField.leadingAnchor.constraint(equalTo: secondTitle.leadingAnchor, constant: -3),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.trailingAnchor.constraint(equalTo: buttonAct.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            someButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            someButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            someButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    @objc func buttonPressed() {
        secondTitle.text = statusText
//        if let statusPrint = statusPrint {
//            print(statusPrint)
//        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
}
