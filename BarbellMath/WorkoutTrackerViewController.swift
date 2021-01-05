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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        navigationItem.rightBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .add, target: self, action: #selector(promptForExercise))
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    // TODO: Extract this into a "helper method". See promptForExercises() for example

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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            exercises.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func promptForExercise() {
        let alert = UIAlertController(
            title: "Enter the name of the exercise you want to add.",
            message: "",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned self, alert] action in
            let answer = alert.textFields![0]
            self.submit(answer.text!)
        }
        
        alert.addAction(submitAction)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "\"Barbell Deadlift\""
        })
        
        self.present(alert, animated: true)
    }
    
    @objc func submit(_ answer: String) {
        let exercise = Exercise(name: answer)
        exercises.append(exercise)
        // TODO: try with reloadSectionAtIndexPath
        UITableView.transition(with: tableView, duration: 0.2, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
    }
}

//Add Detail Label text for items: sets x reps
//Add sections to tableView for workout days-- first the user needs to be able to add this data
//Add Static Table View to get user input
//Can I make extra Days sections removable if not needed?
//Make it possible to open list items and edit them
//See Day notes in Exercise struct


