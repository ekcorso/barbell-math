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
    
    var sectionTitles = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Workout Tracker"
        
        //createNavBarButtonItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        //Keeps storyboard magic from overriding the existing item segue
//        if identifier == "showExistingExerciseDetails"{
//            return false
//        } else {
//            return true
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "showExerciseDetails" {
            if let navigationController = segue.destination as? UINavigationController {
                if let exerciseDetailViewController = navigationController.viewControllers.first as? ExerciseDetailViewController {
                    exerciseDetailViewController.delegate = self
                    if let exercise = selectedExercise {
                        exerciseDetailViewController.exercise = exercise
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let exercise = exercises[indexPath.row]
        
        cell.textLabel?.text = exercise.name
        //cell!.detailTextLabel?.text = exercises[indexPath.row]
        
        return cell
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
}
