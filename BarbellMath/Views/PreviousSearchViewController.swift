//
//  PreviousSearchViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 11/18/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

class PreviousSearchViewController: UITableViewController {
    var previousSearches = [SearchData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PreviousSearchCellView.self, forCellReuseIdentifier: PreviousSearchCellView.identifier)
        self.title = "History"
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let results = DataStorage().retrieve() {
            previousSearches = results
            tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        do {
            try DataStorage().save(searchData: previousSearches)
        } catch {
            print("save failed in ViewWillDisappear")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previousSearches.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PreviousSearchCellView.identifier, for: indexPath) as? PreviousSearchCellView else {
            return UITableViewCell()
        }
        
        let lift = previousSearches[indexPath.row]
        cell.setCellText(lift: lift)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = PlateCountViewController()
            vc.searchData = previousSearches[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            previousSearches.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        do {
            try DataStorage().save(searchData: previousSearches)
        } catch {
            print("Save failed after editing")
        }
    }
}
