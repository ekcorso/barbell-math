//
//  WorkoutTrackerViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 12/27/20.
//  Copyright © 2020 Emily Corso. All rights reserved.
//

import UIKit

class WorkoutTrackerViewController: UITableViewController {
    
    var exercises = [Exercise]()
    var selectedExercise: Exercise?
    var newExerciseButtonTapped: Bool = false
    
    var sectionTitles = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5"]
        
    @IBAction func addNewExercise(_ sender: UIButton) {
        //newExerciseButtonTapped isn't being updated to "true" because this line isn't being hit
        if sender.tag == 1 {
            newExerciseButtonTapped = true
        }
    }
    
    //Add a property for the button itself (the above is the action)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Workout Tracker"
        
        //createNavBarButtonItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController {
            if let exerciseDetailViewController = navigationController.viewControllers.first as? ExerciseDetailViewController {
                exerciseDetailViewController.delegate = self
                if newExerciseButtonTapped {
                    //this code doesn't run because newExerciseButtonTapped is still false when it gets here
                    exerciseDetailViewController.exercise = nil
                } else {
                    if let identifier = segue.identifier, identifier == "showExerciseDetails" {
                        //selectedExercise is always nil until a row is tapped, then it is instantialed as that existing exercise (same memory address)
                        if let existingExercise = selectedExercise {
                            exerciseDetailViewController.exercise = existingExercise
                        }
                    }
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let exercise = exercises[indexPath.row]
        
        if let cell = cell {
                cell.textLabel?.text = exercise.name
                cell.detailTextLabel?.text = "Sets: \(exercises[indexPath.row].sets), Reps: \(exercises[indexPath.row].reps)"
            } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        }
        return cell!
        //Ask Mike what consequences force-unwrapping the cell might have
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            exercises.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exercise = exercises[indexPath.row]
        selectedExercise = exercise
        performSegue(withIdentifier: "showExerciseDetails", sender: nil)
    }
}

extension WorkoutTrackerViewController: ExerciseDetailViewControllerDelegate {
    func exerciseDetailViewControllerDidCreate(exercise: Exercise) {
        exercises.append(exercise)
        tableView.reloadData()
    }
    
    func didEditExercise() {
        tableView.reloadData()
        selectedExercise = nil
    }
}
