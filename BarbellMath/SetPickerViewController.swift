//
//  SetPickerViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 1/16/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

protocol SetPickerViewControllerDelegate: class {
    func setPickerViewControllerDidUpdate(sets: Int)
}

class SetPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    var pickerData = Array(1...30)
    var sets: Int = 0
    weak var delegate: SetPickerViewControllerDelegate?
    
    @IBAction func tappedDone(_ sender: Any) {
        delegate?.setPickerViewControllerDidUpdate(sets: sets)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        title = "Sets"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sets = row + 1
    }
}
