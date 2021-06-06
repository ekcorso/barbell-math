//
//  WeightSelectionViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 5/28/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

class WeightSelectionViewController: UIViewController {
    
    let weightText = UITextField()
    let weightButton = UIButton()
    
//    let stackView = UIStackView()
//    let spacerView1 = UIView()
//    let spacerView2 = UIView()
//    let padding: CGFloat = 100
        
    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = "Let's do some Barbell Math"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        establishSubviews()
        setConstraints()
    }
    
    @objc func didTapWeightButton() {
        //pass the weight to the next vc
        let viewController = PlateCountViewController()
        
        if let text = weightText.text, let weightAsDouble = Double(text) {
        viewController.totalWeight = weightAsDouble
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension WeightSelectionViewController {
    
    func establishSubviews() {
//        view.addSubview(stackView)
//        stackView.addArrangedSubview(spacerView1)
//        stackView.addArrangedSubview(weightText)
//        stackView.addArrangedSubview(weightButton)
//        stackView.addArrangedSubview(spacerView2)
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.spacing = 30
//        //stackView.distribution = .equalSpacing
//        //stackView.setCustomSpacing(30, after: weightText)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weightText)
        weightText.placeholder = "Weight in pounds"
        weightText.textAlignment = .center
        weightText.borderStyle = .line
        weightText.textColor = .black
        weightText.backgroundColor = .white
        weightText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weightButton)
        weightButton.setTitle("Show me how to load it", for: UIControl.State.normal)
        weightButton.titleLabel?.textColor = .black
        weightButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        weightButton.backgroundColor = .systemTeal
        weightButton.layer.cornerRadius = 4
        weightButton.translatesAutoresizingMaskIntoConstraints = false
        weightButton.addTarget(self, action: #selector(didTapWeightButton), for: .touchUpInside)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: padding),
//            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -padding),
//            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            weightText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 120),
            weightText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightText.widthAnchor.constraint(equalToConstant: 225),
            weightText.heightAnchor.constraint(equalToConstant: 40),

            weightButton.topAnchor.constraint(equalTo: weightText.bottomAnchor, constant: 10),
            weightButton.centerXAnchor.constraint(equalTo: weightText.centerXAnchor, constant: 0),
            weightButton.widthAnchor.constraint(equalTo: weightText.widthAnchor),
            weightButton.heightAnchor.constraint(equalTo: weightText.heightAnchor)
        ])
    }
}
