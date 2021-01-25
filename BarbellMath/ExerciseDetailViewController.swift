//
//  ExerciseEntryViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 1/15/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation
import UIKit

protocol ExerciseDetailViewControllerDelegate {
    func exerciseDetailViewControllerDidCreate(exercise: Exercise)
}

class ExerciseDetailViewController: UITableViewController {
    
    @IBOutlet weak var exerciseName: UITextField!
    
    var delegate: ExerciseDetailViewControllerDelegate?
    var exercise: Exercise?
    
    //TODO: Rename tappedDone for what it will do rather than what it just did
    @IBAction func tappedDone(_ sender: Any) {
        if let exercise = exercise {
            if let exerciseNameText = exerciseName.text {
                exercise.name = exerciseNameText
                //delegate?.exerciseDetailViewControllerDidCreate(exercise: exercise)
            }
        } else {
            if let exerciseNameField = exerciseName,
                let exerciseNameText = exerciseNameField.text {
                let exercise = Exercise(name: exerciseNameText)
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
        
        if let exercise = exercise {
            exerciseName.text = exercise.name
        }
    }
}
