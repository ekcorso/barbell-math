//
//  RepPickerViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 1/16/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

protocol RepPickerViewControllerDelegate: class {
    func repPickerViewControllerDidUpdate(reps: Int)
}

class RepPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [Int] = Array(1...50)
    var exercise: Exercise?
    var reps: Int = 0
    weak var delegate: RepPickerViewControllerDelegate?
    
    @IBAction func tappedDone(_ sender: Any) {
        delegate?.repPickerViewControllerDidUpdate(reps: reps)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        title = "Reps"
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
        reps = row + 1
    }
}
