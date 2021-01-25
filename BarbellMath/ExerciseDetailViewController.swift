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
            }
        } else {
            //optionally creates a new variable called exercise name field and assigns to it the value of exerciseName (the textfield). Then it creates a value called exerciseNameText and assigns it the value of the text in the exerciseNameField if that exists.
            if let exerciseNameField = exerciseName,
                let exerciseNameText = exerciseNameField.text {
                //creats a new exercise variable that is an exercise object whose name property is set to the value of the textbox's text.
                let exercise = Exercise(name: exerciseNameText)
                //if the delegate exists, pass it the exercise object created obove.
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
