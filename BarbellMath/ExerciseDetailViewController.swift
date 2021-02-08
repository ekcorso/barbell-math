//
//  ExerciseEntryViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 1/15/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation
import UIKit

protocol ExerciseDetailViewControllerDelegate: class {
    func exerciseDetailViewControllerDidCreate(exercise: Exercise)
    func didEditExercise()
}

class ExerciseDetailViewController: UITableViewController {
    
    @IBOutlet weak var exerciseName: UITextField!
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var repLabel: UILabel!
    
    weak var delegate: ExerciseDetailViewControllerDelegate?
    var exercise: Exercise?
    var sets: Int = 0
    
    //    var sets: Int {
//        if let exercise = exercise {
//            return exercise.sets
//        } else {
//            return 0
//        }
//    }
    var reps: Int = 0
    
    func updateTableProperties(exercise: Exercise) {
        exerciseName.text = exercise.name
        
        setLabel.text = "Sets: \(exercise.sets)"
        repLabel.text = "Reps: \(exercise.reps)"
    }
    
    @IBAction func tappedDone(_ sender: Any) {
        if let exercise = exercise {
            if let exerciseNameText = exerciseName.text {
                exercise.name = exerciseNameText
                //The line below was updating sets to 0 (the initialized value above) any time ECVD was opened but not edited because sets is only updated to a value when SPVC is opened
                //exercise.sets = sets
                delegate?.didEditExercise()
            }
        } else {
            if let exerciseNameField = exerciseName,
                let exerciseNameText = exerciseNameField.text {
                let exercise = Exercise(name: exerciseNameText, sets: sets, reps: reps)
                delegate?.exerciseDetailViewControllerDidCreate(exercise: exercise)
            } else {
                assertionFailure("Failed to unwrap exererciseName.")
            }
        }

        UITableView.transition(with: tableView, duration: 0.2, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)

        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        
        if let exercise = exercise {
            updateTableProperties(exercise: exercise)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "SetPickerSegue" {
            if let setPickerViewController = segue.destination as? SetPickerViewController {
                setPickerViewController.delegate = self
            }
        }
        if let indentifier = segue.identifier, indentifier == "RepPickerSegue" {
            if let repPickerViewController = segue.destination as? RepPickerViewController {
                repPickerViewController.delegate = self
            }
        }
    }
}

extension ExerciseDetailViewController: SetPickerViewControllerDelegate {
    func setPickerViewControllerDidUpdate(sets: Int) {
        self.sets = sets
        self.setLabel.text = "Sets: \(sets)"
    }
}

extension ExerciseDetailViewController: RepPickerViewControllerDelegate {
    func repPickerViewControllerDidUpdate(reps: Int) {
        self.reps = reps
        self.repLabel.text = "Reps: \(reps)"
    }
}
