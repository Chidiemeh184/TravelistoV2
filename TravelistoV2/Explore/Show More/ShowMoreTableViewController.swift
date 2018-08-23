//
//  ShowMoreTableViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ShowMoreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName:  ShowMoreTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:  ShowMoreTableViewCell.identifier)
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }

}


//MARK: Row Height

extension ShowMoreTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultHeight = CGFloat(75)
        return defaultHeight
    }
}

//MARK: Tableview Data Source

extension ShowMoreTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfTableCellRows = 7
        return numberOfTableCellRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: ShowMoreTableViewCell.identifier) as!
        ShowMoreTableViewCell
        return tableViewCell
    }
}

// MARK: - Navigation & Segue

extension ShowMoreTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.showMoreToExploreOpen {
            //Send stuffs
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Segue.showMoreToExploreOpen, sender: (tableView, indexPath))
    }
}


