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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
    }
    
    func setCellText(lift: SearchData) {
        let weightText = "\(Int(lift.weight))\(lift.units!)"
        let attributedWeightText = NSMutableAttributedString(string: weightText)
        
        attributedWeightText.addAttribute(.strokeWidth, value: -3, range: NSRange(location: 0, length: attributedWeightText.length))
        
        textLabel?.attributedText = attributedWeightText
        
        if lift.units == "lbs" {
            detailTextLabel?.text = "\(String(lift.barWeight))lb bar"
        } else if lift.units == "kgs" {
            detailTextLabel?.text = "\(String(lift.barWeight))kg bar"
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
