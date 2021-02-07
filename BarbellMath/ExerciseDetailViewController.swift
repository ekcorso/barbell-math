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
    
    weak var delegate: ExerciseDetailViewControllerDelegate?
    var exercise: Exercise?
    var sets: Int = 0
    
    //TODO: Rename tappedDone for what it will do rather than what it just did
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
                //exercise is initialized here, when the done button is tapped
                let exercise = Exercise(name: exerciseNameText, sets: sets)
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
            exerciseName.text = exercise.name
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "SetPickerSegue" {
            if let setPickerViewController = segue.destination as? SetPickerViewController {
                setPickerViewController.delegate = self
            }
        }
    }
}

extension ExerciseDetailViewController: SetPickerViewControllerDelegate {
    func setPickerViewControllerDidUpdate(sets: Int) {
        self.sets = sets
        //exercise is nil at this point, so this block is skipped
        if let exercise = exercise {
            exercise.sets = sets
            //reset/ reload the text label that shows the number of sets here
        }
    }
}
