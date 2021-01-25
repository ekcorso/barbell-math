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
    
    var sectionTitles = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Workout Tracker"
        
        //createNavBarButtonItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //Keeps storyboard magic from overriding the existing item segue
        if identifier == "showExistingExerciseDetails"{
            return false
        } else {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue was called")
        if let identifier = segue.identifier, identifier == "showExerciseDetails" {
            if let navigationController = segue.destination as? UINavigationController {
                if let exerciseDetailViewController = navigationController.viewControllers.first as? ExerciseDetailViewController {
                    print("prepare(for segue) with segue identifier \(segue.identifier) was called")
                    exerciseDetailViewController.delegate = self
                    print("Exercise name after segue: \(exerciseDetailViewController.exerciseName)")
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
        //Creates a variable called exercise and assigns it the value at the index in the exercises array that corresponds to the indexPath of the row the user tapped.
        let exercise = exercises[indexPath.row]
        //Creates an exercise view cotroller instance. **Is there a way to get a reference to the EDVC instance that the storyboard knows about instead, maybe the one that prepare for segue uses?**
        let exerciseDetailViewController = ExerciseDetailViewController()
        //Create a references to the navigation controller that has this detail view controller as it's root view
        let navigationController = UINavigationController(rootViewController: exerciseDetailViewController)
        
        //assigns workout tracker view controller as exercise view controller's delegate
        exerciseDetailViewController.delegate = self
        //assigns the exercise created above (the one already in the table view) as the value of exercise detail view controller's exercise property
        //Is the exerciseDetailViewController below the same one that is being created when I tap the arrow to access the EDVC from a row in the table view controller? Are we updating a different instance of the view controller than the one we're trying to access? Mike says the properties of the EDVC don't persist between instances, so if we update the wrong instance it wont store the value.
        exerciseDetailViewController.exercise = exercise
        print("Exercise name after didSelectRowAt runs: \(exerciseDetailViewController.exerciseName)")
        //presents the navigation view controller (??) modally when the row is tapped
        present(navigationController, animated: true, completion: nil)
    }

//
//    @objc func promptForExercise() {
//        let alert = UIAlertController(
//            title: "Enter the name of the exercise you want to add.",
//            message: "",
//            preferredStyle: .alert
//        )
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned self, alert] action in
//            let answer = alert.textFields![0]
//            self.submit(answer.text!)
//        }
//
//        alert.addAction(submitAction)
//
//        alert.addTextField(configurationHandler: { textField in
//            textField.placeholder = "\"Barbell Deadlift\""
//        })
//
//        self.present(alert, animated: true)
//    }
//
//    @objc func submit(_ answer: String) {
//        let exercise = Exercise(name: answer)
//        exercises.append(exercise)
//        // TODO: try with reloadSectionAtIndexPath
//        UITableView.transition(with: tableView, duration: 0.2, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
//    }
//
//    func createNavBarButtonItems() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//        barButtonSystemItem: .add, target: self, action: #selector(promptForExercise))
//
//        navigationItem.leftBarButtonItem = editButtonItem
//    }
}

extension WorkoutTrackerViewController: ExerciseDetailViewControllerDelegate {
    func exerciseDetailViewControllerDidCreate(exercise: Exercise) {
        exercises.append(exercise)
        
        tableView.reloadData()
    }
}
