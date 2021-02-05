//
//  RepPickerViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 1/16/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

//To create a delegate pattern: first create a protocol that defines (but does not implement) the delegate's func (VC that the delegate will belong to, eg RepPicker), then create a delegate property (also in RepPicker), then add conformance via an extension in the destination vc (eg. EDVC), then assign the delegate in prepareForSegue (EDVC)

class RepPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [Int] = Array(1...50)
    
    var exercise: Exercise?
    
    @IBAction func tappedDone(_ sender: Any) {
        //update exercise object with rep data and pass it back
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

}
