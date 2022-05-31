//
//  NewOrAddViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 5/30/22.
//  Copyright © 2022 Emily Corso. All rights reserved.
//

import UIKit

class NewOrAddViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        setConstraints()
    }
    
    //MARK: - Setup View
    
    func setConstraints() {
        view.addSubview(descriptionLabel)
        view.addSubview(addToLoadButton)
        view.addSubview(newLoadButton)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 50),
            
            addToLoadButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            addToLoadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            newLoadButton.topAnchor.constraint(equalTo: addToLoadButton.bottomAnchor, constant: 30),
            newLoadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    let descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Would you like to start a new lift, or add weight to a loaded bar?"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let addToLoadButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Weight To Bar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .green
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -10, bottom: 5, right: -10)
        button.layer.cornerRadius = 10
//        var configuration = UIButton.Configuration.filled()
//        configuration.title = "Add weight to bar"
//        configuration.baseBackgroundColor = .orange
////        configuration.image
//        configuration.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        return button
    }()
    
    let newLoadButton:UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start New Load", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .purple
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.layer.cornerRadius = 10
        return button
    }()

}

