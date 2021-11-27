//
//  PreviousSearchCellView.swift
//  BarbellMath
//
//  Created by Emily Corso on 11/22/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

class PreviousSearchCellView: UITableViewCell {
    static let identifier = "CustomCell"
    
    var totalWeight: UILabel = {
        var weight = UILabel()
        weight.translatesAutoresizingMaskIntoConstraints = false
        weight.font = UIFont.preferredFont(forTextStyle: .title3)
        weight.textColor = .darkGray
        weight.text = "Hello world"
        return weight
    }()

    var barWeight: UILabel = {
       var bar = UILabel()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.font = UIFont.preferredFont(forTextStyle: .body)
        bar.textColor = .lightGray
        return bar
    }()

    var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
//        stackView.backgroundColor = .blue
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blue
//        contentView.addSubview(stackView)
//
//        stackView.addArrangedSubview(totalWeight)
//        stackView.addArrangedSubview(barWeight)
        
        addSubview(totalWeight)
//        addSubview(barWeight)
//
        NSLayoutConstraint.activate([
            totalWeight.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            totalWeight.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            totalWeight.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            totalWeight.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
//            stackView.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
    
//    init(totalWeight: Double, units: String, barWeight: Double) {
//        super.init(style: .default, reuseIdentifier: "Cell")
//
//        self.totalWeight.text = "Weight: \(Int(totalWeight)) \(units)"
//        self.barWeight.text = "Bar Size: \(Int(barWeight))"
//
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }

}
